description 'ESX Weashop'

version '1.0.1'

client_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}
