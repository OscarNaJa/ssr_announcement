fx_version 'cerulean'
game 'gta5'

lua54 'yes'

name 'ssr_announce'
author 'SSR'
description 'Responsive ESX announcement UI with configurable logo and sound volume.'
version '1.0.0'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/styles.css',
	'html/script.js',
	'html/img/*',
	'html/sound/*',
}

shared_script 'config.lua'

server_script 'code/server.lua'
client_script 'code/client.lua'
