fx_version 'bodacious'
game 'gta5'
lua54 "yes"

author "BurakBuluntu"
description "bb-drugsale"
version "1.1"
ui_page 'html/ui.html'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/en.lua'
	--'locales/de.lua'
	--'locales/fr.lua'
	--'locales/it.lua'
	--'locales/tr.lua'
}

client_script{
	'config.lua',
    'client.lua'
}

server_scripts { 
	'config.lua',
	'server.lua'
}

files {
	'html/ui.html',
	'html/*.css',
	'html/fonts/*.woff',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/img/*.gif'
}

escrow_ignore {
  'locales/*.lua',  -- Ignore all locales files in any subfolder
  'config.lua',  -- Only ignore one file
}