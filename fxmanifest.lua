--[[
    fxmanifest.lua is owned by NewLife©.  
    Do not take ownership of this file 
    without permission from the developers.

    Create at 27/09/2022 - 14:57:00
]]--
---@author Dezel

fx_version 'adamant'
games { 'gta5' };
lua54 'yes'

shared_scripts {
	'cfg.lua',
	"ui/RMenu.lua",
	"ui/menu/RageUI.lua",
	"ui/menu/Menu.lua",
	"ui/menu/MenuController.lua",
	"ui/components/*.lua",
	"ui/menu/elements/*.lua",
	"ui/menu/items/*.lua",
	"ui/menu/panels/*.lua",
	"ui/menu/panels/*.lua",
	"ui/menu/windows/*.lua",
}
client_script 'client/*.lua'
server_script 'server/*.lua'