fx_version 'cerulean'
games {'gta5'}

description ''

lua54 'yes'

shared_script {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',
	'@ox_lib/init.lua',
}

server_scripts {
	'server/main.lua',
}

client_scripts {
	'client/main.lua',
}