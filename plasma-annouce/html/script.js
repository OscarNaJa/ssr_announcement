
$(document).ready(function() {
	$('.SM').html(`<div class="annouce"></div>`)

	window.addEventListener('message', function(event) {
		const data = event.data;
		if (data !== undefined) {
			if (data.type == 'annouce') {
				const number = Math.floor(1e3 * Math.random() + 1);
				SM.PlaySound('notify.ogg');
				$('.annouce').append(`
					<div class="annouce_index" id="annouce_${ number }" style="--bg_color: ${ data.style.bg_color }; --icon_color: ${ data.style.icon_color }; --title_color: ${ data.style.title_color }; --text_color: ${ data.style.text_color };">
						<div class="annouce_index-title"><img src="./img/logo.png"></div>
						<div class="annouce_index-text"><span>${ data.title }</span> ${ data.msg }</div>
						<div class="annouce_index-icon"><iconify-icon icon="foundation:megaphone"></iconify-icon></div>
					</div>
				`);

				setTimeout(function() {
					$(`#annouce_${ number }`).addClass('show');
				}, 1000);

				setTimeout(function() {
					$(`#annouce_${ number }`).addClass('slide-out');
					setTimeout(function() {
						$(`#annouce_${ number }`).remove();
					}, 500);
				}, data.duration * 1000);
			} 
		}
	})
})

SM = {
	PlaySound : function(key, volume) {
		let sound = new Audio(`./sound/${ key }`);
		sound.volume = volume ? volume : 0.3;
		sound.play();
	},
}
