Config = {}

-- Turn this to false if you want everyone to use this.
Config.OnlyPolicemen = true

-- This is how much ammo you should get per weapon you take out.
Config.ReceiveAmmo = 250

-- You don't need to edit these if you don't want to.
Config.Armory = { ["x"] = -430.77, ["y"] = 5999.09, ["z"] = 31.72, ["h"] = 223.47 }
Config.ArmoryPed = { ["x"] = -429.17, ["y"] = 5997.86, ["z"] = 31.75, ["h"] = 53.12, ["hash"] = "s_m_y_cop_01" }

-- This is the available weapons you can pick out.
Config.ArmoryWeapons = {	
	--{ ["hash"] = "WEAPON_VINTAGEPISTOL", ["type"] = "pistol" },
	{ ["hash"] = "weapon_stungun", ["type"] = "pistol" },
	{ ["hash"] = "weapon_nightstick", ["type"] = "pistol" },
	{ ["hash"] = "weapon_flashlight", ["type"] = "pistol" },
	{ ["hash"] = "weapon_combatpistol", ["type"] = "pistol" },
	--{ ["hash"] = "weapon_combatpdw", ["type"] = "rifle" },
	--{ ["hash"] = "weapon_carbinerifle", ["type"] = "rifle" },
	{ ["hash"] = "weapon_specialcarbine", ["type"] = "rifle" },
	--{ ["hash"] = "weapon_pumpshotgun", ["type"] = "rifle" }
}
