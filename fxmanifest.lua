fx_version 'cerulean'
games {'gta5'}

author '𝐒 𝐘 𝐍 𝐎#1760'
description 'repairshop script for fivem'

lua54 'yes'

shared_script {
	'@es_extended/imports.lua'
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
