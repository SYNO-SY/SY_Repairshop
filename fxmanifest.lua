fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

version      '0.2'
author '𝐒 𝐘 𝐍 𝐎#1760'
description 'repairshop script for fivem'

lua54 'yes'

shared_script {
	'@ox_lib/init.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/en.lua',

}

server_scripts {
	'server/main.lua',
}

client_scripts {
	'client/main.lua',
}
