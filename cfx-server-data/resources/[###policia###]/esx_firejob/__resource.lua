resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Fire Job [Mod from esx_ambulancejob]'

version '1.0.2'

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',
  'client/main.lua'
}

exports {
  'openFire',
  'getJob'
}