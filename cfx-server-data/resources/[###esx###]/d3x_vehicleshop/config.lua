Config                            = {}
Config.DrawDistance               = 50.0
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.EnableOwnedVehicles        = true
Config.ResellPercentage           = 1

Config.Locale                     = 'br'

Config.Alineacion				  = "centerLeft"

Config.LicenseEnable = true -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -237.51, y = 6201.47, z = 30.94 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 36
	},
	ShopOutside = {
		Pos   = { x = -253.16, y = 6206.18, z = 31.41 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 62.11,
		Type  = -1
	},

	Shop2 = {
		Pos   = { x = -55.36, y = -1089.72, z = 26.42 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 36
	},
	Shop3 = {
		Pos   = { x = -53.19, y = -1100.89, z = 26.35 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 36
	},

	ResellVehicle = {
		Pos   = { x = -259.19, y = 6207.73, z = 30.51 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}

}
