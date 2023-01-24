fx_version 'adamant'
games {'gta5'}

description 'PixelWorld Banking'
name 'PixelWorld: pw_banking'
author 'PixelWorldRP [Chris Rogers] - https://pixelworldrp.com'
version 'v1.0.2'

server_scripts {
    '@pw_mysql/lib/MySQL.lua',
    'config/config.lua',
    'server/wrappers/buisness.lua',
    'server/wrappers/useraccounts.lua',
    'server/wrappers/gangs.lua',
    'server/main.lua'
}

client_scripts {
    'config/config.lua',
    'client/main.lua',
    'client/nui.lua'
}

ui_page 'nui/index.html'

files {
    'nui/images/logo.gif',
    'nui/images/logo.png',
    'nui/scripting/jquery-ui.css',
    'nui/scripting/external/jquery/jquery.js',
    'nui/scripting/jquery-ui.js',
    'nui/style.css',
    'nui/index.html',
    'nui/pw_banking.js',
}

dependencies {
    'pw_mysql',
    'pw_notify',
    'pw_progbar',
    'pw_menu',
    'pw_base'
}