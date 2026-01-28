fx_version 'cerulean'
game 'gta5'

author 'CoreZ Team'
version '0.1.0'

shared_scripts {
    'configs/*.lua',
    'shared/locale.lua',
    'languages/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/commands.lua',
    'client/menus/menu_init.lua',
    'client/menus/spawn_menu.lua',
    'client/menus/car_menu.lua',
    'client/menus/gun_menu.lua',
    'client/menus/main_menu.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
