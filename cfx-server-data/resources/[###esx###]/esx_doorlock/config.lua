Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	--[[ Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},
	
	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police' },
		locked = false
	},
	
	]]
	
	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.2, 32.0),
		authorizedJobs = { 'police', 'admin' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'cls_shrf2door_l',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'cls_shrf2door_r',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},
	
	{ -- Capitan
		textCoords = vector3(-445.55, 6006.14, 37.0),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ra_door2',
				objYaw = 45.0,
				objCoords  = vector3(-445.86, 6005.97, 36.7),
			},

			{
				objName = 'v_ilev_ra_door2',
				objYaw = -135.0,
				objCoords  = vector3(-445.21, 6006.5, 36.7)
			}
		}
	},
	--[[apa_V_ILev_SS_Door7
	{ -- Inspector
		objName = 'apa_v_ilev_ss_door7', -- Puerta sheriff inspector
		objYaw = 45.0,
		objCoords  = vector3(-442.78, 6006.71, 36.69),
		textCoords = vector3(-442.78, 6006.71, 37.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		size = 1
	},
	]]
		
	{
		objName = 'cls_sheriff_workdoor_1', -- Sheriff puertas de detrás
		objYaw = 135.0,
		objCoords  = vector3(-447.0, 6002.08, 31.69),
		textCoords = vector3(-446.77, 6001.81, 32.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		size = 1
	},
	
	{
		objName = 'cls_sheriff_workdoor_1', -- Sheriff puertas de detrás [vestuario]
		objYaw = 135.0,
		objCoords  = vector3(-451.55, 6006.52, 31.69),
		textCoords = vector3(-451.35, 6006.52, 32.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		size = 1
	},
	
	{
		objName = 'v_ilev_phroofdoor', -- Puerta sheriff armeria
		objYaw = 135.0,
		objCoords  = vector3(-430.65, 5994.09, 31.69),
		textCoords = vector3(-430.65, 5994.09, 32.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		size = 1
	},
	
	
	{
		objName = 'p_gate_prison_01_s', -- Mapeado comisaria pop
		objCoords  = vector3(-450.451, 6025.05, 30.492),
		textCoords = vector3(-452.451, 6028.05, 34.492),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 11, -- Está puesta esta distancia para que se pueda abrir con el coche pero que no se use a la vez que las otras puertas
		size = 2
	},


	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 12,
		size = 2
	},
	
	--- Comisaria Strepsils RP
	
	-- Puertas calabozo:	cls_PH_CELLGATE
	
	{
		objName = 'cls_ph_cellgate', -- Puerta calabozo paleto sheriff grande
		objYaw = 315.0,
		objCoords  = vector3(-438.6, 5987.8, 31.69),
		textCoords = vector3(-438.6, 5987.8, 32.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.3,
		size = 1
	},
	
	{
		objName = 'cls_ph_cellgate', -- Puerta calabozo paleto sheriff pequeña
		objYaw = 45.0,
		objCoords  = vector3(-438.5, 5991.6, 31.69),
		textCoords = vector3(-438.6, 5991.6, 32.69),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.3,
		size = 1
	},
	
	
	------------------------------------------------------------- Mecanico
	
	{
		objName = 'v_ilev_carmod3door', -- Mecanico paleto [derecha]
		objCoords  = vector3(114.3135, 6623.233, 32.67305),
		textCoords = vector3(114.3135, 6623.233, 34.492),
		authorizedJobs = { 'mechanic', 'admin' },
		locked = false,
		distance = 9, -- Está puesta esta distancia para que se pueda abrir con el coche pero que no se use a la vez que las otras puertas
		size = 2
	},
	
	{
		objName = 'v_ilev_carmod3door', -- Mecanico paleto [izquierda]
		objCoords  = vector3(108.8502, 6617.877, 32.67305),
		textCoords = vector3(108.8502, 6617.877, 34.492),
		authorizedJobs = { 'mechanic', 'admin' },
		locked = false,
		distance = 9, -- Está puesta esta distancia para que se pueda abrir con el coche pero que no se use a la vez que las otras puertas
		size = 2
	},
	
	{
		objName = 'v_ilev_ss_door5_r', -- Mecanico paleto pequeña
		objYaw = 45.0,
		objCoords  = vector3(105.1518, 6614.655, 32.58521),
		textCoords = vector3(104.37, 6614.52, 33.4),
		authorizedJobs = { 'police', 'admin' },
		locked = true,
		distance = 2.5,
		size = 1
	},
	
	

	--v_ilev_ra_door2
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}

--https://wiki.gtanet.work/index.php?title=Doors