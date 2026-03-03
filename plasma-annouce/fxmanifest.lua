fx_version 'adamant'
game 'gta5'

version '3011'

lua54 'yes'

ui_page 'html/index.html'
files {
	'html/index.html',
	'html/styles.css',
	'html/script.js',
	'html/img/*',
	'html/sound/*',
}

server_scripts {
	'config.lua',
	'code/server.lua',
}

client_scripts {
	'config.lua',
	'code/client.lua',
}