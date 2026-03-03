$(function() {
	$('#app').html('<div class="announce-list"></div>');

	window.addEventListener('message', function(event) {
		const data = event.data;
		if (!data || data.type !== 'announce') {
			return;
		}

		const id = `announce_${Math.floor(Math.random() * 100000)}`;
		const style = data.style || {};
		const safeTitle = data.title || '';
		const safeMessage = data.msg || '';
		const logo = data.logo || 'img/logo.png';
		const sound = data.sound || { file: 'notify.ogg', volume: 0.3 };

		SM.playSound(sound.file, sound.volume);

		$('.announce-list').append(`
			<div class="announce-item" id="${id}" style="--bg_color: ${style.bg_color || 'rgba(7, 11, 18, 0.97)'}; --icon_color: ${style.icon_color || 'rgb(75, 126, 214)'}; --title_color: ${style.title_color || '#ffffff'}; --text_color: ${style.text_color || '#ffffff'};">
				<div class="announce-badge"><img src="${logo}" alt="logo"></div>
				<div class="announce-text"><span>${safeTitle}</span>${safeMessage}</div>
				<div class="announce-icon"><iconify-icon icon="foundation:megaphone"></iconify-icon></div>
			</div>
		`);

		setTimeout(function() {
			$(`#${id}`).addClass('slide-out');
			setTimeout(function() {
				$(`#${id}`).remove();
			}, 350);
		}, (Number(data.duration) || 10) * 1000);
	});
});

const SM = {
	playSound(file, volume) {
		const sound = new Audio(`./sound/${file}`);
		sound.volume = Number.isFinite(Number(volume)) ? Math.max(0, Math.min(1, Number(volume))) : 0.3;
		sound.play().catch(function() {});
	},
};
