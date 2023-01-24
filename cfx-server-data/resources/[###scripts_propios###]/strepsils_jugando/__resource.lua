resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Aniol0012'
description 'Script de jugando para discord con trabajos'
version '2.0'

shared_script 'config.lua'
client_script {
	'client.lua'
}

server_script{
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}