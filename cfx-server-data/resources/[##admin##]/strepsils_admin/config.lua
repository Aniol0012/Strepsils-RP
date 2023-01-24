Config                            = {}

Config.DrawDistance               = 100.0

Config.NPCJobEarnings             = {min = 300, max = 600}
Config.MinimumDistance            = 3000 -- Distancia mínima para recojer los NPC para el trabajo de admin. Cuanto mas alto el numero mas lejana será la destinación.

Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menu general
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.Salir	              	  = true -- Generar una fila para salir del menu

Config.AbrirGeneral	              = true -- Menu general

Config.AbrirVehMenu	              = true -- Menu de vehículos

Config.AbrirObjetos	              = true -- Menu de objetos

Config.GPS			              = true -- Poder marcar el INEM

Config.Delgun		              = true -- Arma eliminadora de objetos

Config.Alineacion              	  = "right" -- Alineacion del esx_menu_default (derecha)

Config.Locale                     = 'en'

Config.FotoMsg                    = 'CHAR_STEVE'

Config.AfkCamara	              = false -- Si esta en false al pasar 30 segundos de estar en afk no se cambiara la vista del personaje a una cinematica. Si esta en true si que lo hará.

Config.AFK			              = false -- True para que en 14 min de afk se te kickee.

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menu general admin (Menu general > Menu general admin)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.Factura		        	  = true -- Poder poner facturas (se cobran al que ha puesto la factura)

Config.Reportes		        	  = true -- Crea un blip de reporte y un mensaje

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menu vehículos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.EliminarVehiculo        	  = true -- Poder hacer un dv

Config.DesbloquearVehiculo     	  = true -- Si esta cerrado por el propietario, con esto fuerzas la cerradura

Config.Gasolina			     	  = true -- Pone la gasolina del vehículo al 100%

Config.Tracker			     	  = true -- Abre el trackeador policial

Config.Limpiar			     	  = true -- Limpia el vehículo

Config.InfoVeh			     	  = false -- Informacion del vehículo (matrícula y propietario)

Config.DvAll			     	  = true -- Eliminar todos los coches

Config.Seguro					  = true -- Menu extra para eliminar todos los coches





Config.AuthorizedVehicles = {

	{
		model = 'taxi',
		label = 'Test',
	},
	
	--[[
	{
		model = 'police',
		label = 'Policia'
	}
	--]]
	
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = -144.73, y = 6310.12, z = 31.62},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 36, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = -135.57, y = 6315.97, z = 30.46},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 225.0
	},

	VehicleDeleter = {
		Pos   = {x = -143.55, y = 6314.44, z = 30.53},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1, Rotate = false
	},

	adminActions = {
		Pos   = {x = -144.07, y = 6304.04, z = 35.49},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Type  = 20, Rotate = true
	},
	
	Cloakroom = {
		Pos     = {x = -155.89, y = 6296.36, z = 35.53},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 0, g = 255, b = 0},
		Type    = 21, Rotate = true
	}
}
