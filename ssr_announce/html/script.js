$(function() {
	$('.SM').html('<div class="annouce"></div>');

	window.addEventListener('message', function(event) {
		const data = event?.data;
		if (!data) {
			return;
		}

		const announceType = data.type === 'announce' || data.type === 'annouce';
		if (!announceType) {
			return;
		}

		const number = Math.floor(Math.random() * 100000 + 1);
		const style = data.style || {};
		const sound = data.sound || {};
		const logoPath = data.logo || './img/logo.png';

		SM.playSound(sound.file || 'notify.ogg', sound.volume);

		$('.annouce').append(`
			<div class="annouce_index" id="annouce_${number}" style="--bg_color: ${style.bg_color || 'rgba(7, 11, 18, 0.97)'}; --icon_color: ${style.icon_color || 'rgb(75, 126, 214)'}; --title_color: ${style.title_color || '#ffffff'}; --text_color: ${style.text_color || '#ffffff'};">
				<div class="annouce_index-title"><img src="./${logoPath.replace(/^\.\//, '')}"></div>
				<div class="annouce_index-text"><span>${data.title || ''}</span> ${data.msg || ''}</div>
				<div class="annouce_index-icon"><iconify-icon icon="foundation:megaphone"></iconify-icon></div>
			</div>
		`);

		setTimeout(function() {
			$(`#annouce_${number}`).addClass('slide-out');
			setTimeout(function() {
				$(`#annouce_${number}`).remove();
			}, 500);
		}, (Number(data.duration) || 10) * 1000);
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
