-- Define the FX Server version and game type
fx_version "adamant"
game "gta5"

-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- Resource Info
name 'SenkaWolf-RPCCPack'
description 'FiveM Standalone RP Chat & Command Basic Pack'
author 'SenkaWolf (https://github.com/SenkaWolf)'
version '2.3.2'
url 'https://github.com/SenkaWolf/RPChat'

-- Script
shared_script 'config.lua'

client_scripts {
	'client/server-management.lua',
	'client/chat.lua',
	'client/character.lua',
	'client/vehicle.lua'
}
server_script {
	'sv-version-check.lua',
	'server/server-management.lua',
	'server/chat.lua',
	'server/character.lua',
	'server/vehicle.lua'
}

-- Made By SenkaWolf

--                              __
--                            .d$$b
--                          .' TO$;\
--                         /  : TP._;
--                        / _.;  :Tb|
--                       /   /   ;j$j
--                   _.-"       d$$$$
--                 .' ..       d$$$$;
--                /  /P'      d$$$$P. |\
--               /   "      .d$$$P' |\^"l
--             .'           `T$P^"""""  :
--         ._.'      _.'                ;
--      `-.-".-'-' ._.       _.-"    .-"
--    `.-" _____  ._              .-"
--   -(.g$$$$$$$b.              .'
--     ""^^T$$$P^)            .(:
--       _/  -"  /.'         /:/;
--    ._.'-'`-'  ")/         /;/;
-- `-.-"..--""   " /         /  ;
--.-" ..--""        -'          :
--..--""--.-"         (\      .-(\
--  ..--""              `-\(\/;`
--    _.                      :
--                            ;`-
--                           :\
--                           ;
