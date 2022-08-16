fx_version "adamant"
game "gta5"

author "Shiro"
title "ESX Phone Tax"
description "Phone Tax per Phone" 
version "1.5.0"

shared_scripts { 
    '@es_extended/imports.lua',
    'config.lua'
}


client_scripts {
    '/client/client.lua',
}

server_scripts {
    '/server/server.lua',
}
