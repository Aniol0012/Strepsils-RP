resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Tienda de ropa por Aniol0012'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua',
	'client/menu.lua'
}

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css",
	'nui/img/*.png',
	'nui/img/*.jpg',
	'nui/img/corbatas/*.jpg',
	'nui/img/mask/*.jpg',
	'nui/img/pants/*.jpg',
	'nui/img/mochilas/*.jpg',
	'nui/img/manos/*.jpg',
	'nui/img/brazaletes/*.jpg',
	'nui/img/relojes/*.jpg',
	'nui/img/orejas/*.jpg',
	'nui/img/lentes/*.jpg',
	'nui/img/sombreros/*.jpg',
	'nui/img/zapatos/*.jpg',
	'nui/img/chalecos/*.jpg',
	'nui/img/chaquetas/*.jpg',
	'nui/img/blusas/*.jpg',
}

dependencies {
	'es_extended',
	--'skincreator'
	'esx_skin',
}