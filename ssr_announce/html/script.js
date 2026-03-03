$(function() {
	$('.SM').html('<div class="annouce"></div>');

	const activeAnnouncements = new Map();

	function escapeHtml(value) {
		return String(value)
			.replace(/&/g, '&amp;')
			.replace(/</g, '&lt;')
			.replace(/>/g, '&gt;')
			.replace(/"/g, '&quot;')
			.replace(/'/g, '&#39;');
	}

	function normalizeLogoPath(logoPath) {
		const fallbackPath = 'img/logo.png';
		if (!logoPath) {
			return fallbackPath;
		}
		return String(logoPath).replace(/^\.\//, '');
	}

	function buildMessageKey(title, message) {
		return `${title}:::${message}`;
	}

	function getDurationMs(rawDuration) {
		const durationSeconds = Number(rawDuration);
		const safeDuration = Number.isFinite(durationSeconds) && durationSeconds > 0 ? durationSeconds : 10;
		return safeDuration * 1000;
	}

	function scheduleRemoval(id, messageKey, durationMs) {
		const existing = activeAnnouncements.get(messageKey);
		if (!existing) {
			return;
		}

		if (existing.timer) {
			clearTimeout(existing.timer);
		}

		existing.timer = setTimeout(function() {
			const $target = $(`#${id}`);
			$target.addClass('slide-out');
			setTimeout(function() {
				$target.remove();
				activeAnnouncements.delete(messageKey);
			}, 500);
		}, durationMs);
	}

	window.addEventListener('message', function(event) {
		const data = event?.data;
		if (!data) {
			return;
		}

		const announceType = data.type === 'announce' || data.type === 'annouce';
		if (!announceType) {
			return;
		}

		const style = data.style || {};
		const sound = data.sound || {};
		const title = data.title || '';
		const message = data.msg || '';
		const messageKey = buildMessageKey(title, message);
		const durationMs = getDurationMs(data.duration);

		SM.playSound(sound.file || 'notify.ogg', sound.volume);

		const existing = activeAnnouncements.get(messageKey);
		if (existing) {
			existing.count += 1;
			const suffix = existing.count > 1 ? ` x${existing.count}` : '';
			$(`#${existing.id} .annouce_message`).html(`${escapeHtml(message)}${suffix}`);
			scheduleRemoval(existing.id, messageKey, durationMs);
			return;
		}

		const id = `annouce_${Math.floor(Math.random() * 100000 + 1)}`;
		const safeLogoPath = normalizeLogoPath(data.logo);

		$('.annouce').append(`
			<div class="annouce_index" id="${id}" style="--bg_color: ${style.bg_color || 'rgba(7, 11, 18, 0.97)'}; --icon_color: ${style.icon_color || 'rgb(75, 126, 214)'}; --title_color: ${style.title_color || '#ffffff'}; --text_color: ${style.text_color || '#ffffff'};">
				<div class="annouce_index-title"><img src="./${safeLogoPath}"></div>
				<div class="annouce_index-text"><span>${escapeHtml(title)}</span> <span class="annouce_message">${escapeHtml(message)}</span></div>
				<div class="annouce_index-icon"><iconify-icon icon="foundation:megaphone"></iconify-icon></div>
			</div>
		`);

		activeAnnouncements.set(messageKey, {
			id,
			count: 1,
			timer: null,
		});

		scheduleRemoval(id, messageKey, durationMs);
	});
});

const SM = {
	playSound(fileName, volume) {
		const audio = new Audio(`./sound/${fileName}`);
		const parsedVolume = Number(volume);
		audio.volume = Number.isFinite(parsedVolume) ? Math.max(0, Math.min(1, parsedVolume)) : 0.3;
		audio.play().catch(function() {});
	},
};
