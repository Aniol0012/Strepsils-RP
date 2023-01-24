Config                            = {}

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Default
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.DrawDistance               = 100.0

Config.MarkerType                 = 1

Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }

Config.MarkerColor                = { r = 255, g = 0, b = 0 }

Config.EnablePlayerManagement     = true -- Poder controlar los trabajadores [esx_society]

Config.EnableArmoryManagement     = true -- Activar la armería

Config.EnableESXIdentity          = true -- Activar si usas esx_identity

Config.EnableNonFreemodePeds      = false -- Activar esto si quieres poner PEDS

Config.EnableSocietyOwnedVehicles = false -- Poner los coches de sociedad (no recomendado) [esx_society]

Config.EnableLicenses             = true -- Activar las licencias [esx_licences]

Config.MaxInService               = -1 -- Máxima gente en servicio, si no quieres un máximo pon: -1

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menu general
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.Locale                     = 'es' -- Idioma

Config.Alineacion              	  = "right" -- Alineacion del esx_menu_default (derecha)

--Config.Alineacion              	  = 'right' -- Alineacion del esx_menu_default (derecha)

Config.FotoMsg                    = 'CHAR_STEVE'

Config.Salir	              	  = true -- Generar una fila para salir del menú

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Rows
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.General	              	  = true -- Generar una fila para el menú general

Config.Vehciulos	              = true -- Menu de vehículos

Config.Objetos		              = true -- Menu de objetos


Config.mafia1Stations = {

  mafia1 = {

    Blip = {
      Pos     = { x = -1526.38, y = 79.51, z = 55.75 },
      Sprite  = 311,
      Display = 4,
      Scale   = 0.9,
      Colour  = 59,
    },

    AuthorizedWeapons = {
		{ name = 'WEAPON_SWITCHBLADE',    price = 101 },
		{ name = 'WEAPON_PISTOL50',       price = 14000 },
		{ name = 'WEAPON_SMG',            price = 19000 },
		{ name = 'WEAPON_MINISMG',        price = 22000 },
		{ name = 'WEAPON_COMBATMG',       price = 22012 },
		{ name = 'WEAPON_SAWNOFFSHOTGUN', price = 25013 },
		{ name = 'WEAPON_PISTOL50',       price = 28004 },
		{ name = 'WEAPON_REVOLVER',       price = 32005 },
		{ name = 'WEAPON_HEAVYPISTOL',    price = 35006 },
		{ name = 'WEAPON_COMBATPDW',      price = 35017 },
		{ name = 'WEAPON_BULLPUPSHOTGUN', price = 49008 },
		{ name = 'weapon_sawnoffshotgun', price = 50000 },
		{ name = 'weapon_bullpuprifle',   price = 60000 },
		{ name = 'WEAPON_ASSAULTRIFLE',   price = 65019 },
		{ name = 'WEAPON_SNIPERRIFLE',    price = 130511 }, 
		{ name = 'WEAPON_HEAVYSNIPER',    price = 190512 },
    },

	  AuthorizedVehicles = {
	  { name = 'bati2',  label = 'Moto (bati2)' },
      { name = 'felon2',  label = 'Coche oficial (2puertas)' },
      { name = 'kuruma',   label = 'Coche oficial (4puertas)' },
      { name = 'dubsta3',   label = 'Camioneta oficial (dubsta3)' },
      { name = 'pturismo',   label = 'Coche oficial (pturismo)' },
	  },

    Cloakrooms = {
      { x = -811.5, y = 175.14, z = 76.75 },
    },

    Armories = {
      { x = -799.72, y = 177.24, z = 72.83 },
    },

    Vehicles = {
      {
        Spawner    = { x = -806.99, y = 185.05, z = 72.47 },
        SpawnPoint = { x = -825.26, y = 179.91, z = 71.47 },
        Heading    = 136.44,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = -781.67, y = 156.5, z = 67.51 },
        SpawnPoint = { x = -773.12, y = 146.39, z = 67.47 },
        Heading    = 311.36,
      }
    },

    VehicleDeleters = {
      { x = -1516.21, y = 86.21, z = 55.18 },
      { x = -811.84, y = 187.35, z = 72.47 },
    },
	
    BossActions = {
      { x = -811.38, y = 181.17, z = 76.74 }
    },

  },

}
