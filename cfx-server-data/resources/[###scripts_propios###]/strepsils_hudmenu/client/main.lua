--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
--
--			  ███████	████████████	████████	███████		████████	███████		████████████	██				███████			  ██████████	████████
--			  ██			 ██			██	  ██	██			██	  ██	██			     ██    		██				██ 				  ██	  ██	██	  ██
--			  ██			 ██			██	  ██	██			██    ██	██			     ██			██				██				  ██	  ██	██	  ██
--			  ███████	 	 ██			████████	███████		████████	███████	         ██ 		██				███████			  ██████████	████████
--				   ██		 ██			██  ██		██			██				 ██	         ██			██					 ██			  ██  ██		██
--				   ██ 		 ██			██  ██		██			██				 ██	         ██ 		██ 				     ██   		  ██  ██		██
--			  ███████		 ██			██	████	███████		██			███████		████████████	███████████		███████			  ██  ██████	██
--																																								By Aniol0012
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Locales
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local HasAlreadyEnteredMarker, OnJob, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, IsDead, CurrentActionData = false, false, false, false, false, false, {}
local CurrentCustomer, CurrentCustomerBlip, DestinationBlip, targetCoords, LastZone, CurrentAction, CurrentActionMsg

ESX = nil

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- ESX Default
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName(msg)
		EndTextCommandBusyString(type)
		Citizen.Wait(time)

		RemoveLoadingPrompt()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Eventos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menú
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenHudMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hudmenugeneral', {
		title    = '<span style="color:lightgoldenrodyellow;">HUD - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = {
			{label = '<span style="color:red;">📌 Menú de GPS rápido<span style="color:white;">', value = 'gpsmenu'},
			--{label = '<span style="color:yellow;">HUD de abajo<span style="color:white;">', value = 'hud'},
			--{label = '<span style="color:gold;">HUD de arriba<span style="color:white;">', value = 'hud2'},
			--{label = '<span style="color:lightskyblue;">Minimapa<span style="color:white;">', value = 'minimapa'},
			--{label = '<span style="color:green;">FPS<span style="color:white;">', value = 'fps'},
			--{label = '<span style="color:blueviolet;">👮️ Trabajos<span style="color:white;">', value = 'trabajos'},
			--{label = '<span style="color:red;">Cuentakilometros<span style="color:white;">', value = 'cuentakilometros'},
			{label = '<span style="color:moccasin;">📂 Otros<span style="color:white;">', value = 'otros'},
			{label = '<span style="color:green;">🎥 Modo cinematica <span style="color:darkviolet;">[bandas negras]<span style="color:white;">', value = 'cam'},
			{label = '<span style="color:dodgerblue;">💨 Limpiar HUD<span style="color:white;">', value = 'todo'},
			{label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'gpssalir'}
			
	}}, function(data, menu)
		if data.current.value == 'cuentakilometros' then
			TriggerEvent('coche:cuentakilometros')
			TriggerEvent('strepsils_fuel')
			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
			ESX.ShowAdvancedNotification('Vehículo', '~s~', 'Has ~g~encendido ~s~/ ~r~apagado ~s~el cuentakilometros.', mugshotStr, 1)
			UnregisterPedheadshot(mugshot)
		
		elseif data.current.value == 'gpsmenu' then -- Aquí está puesto el config. //and Config.MenuGPS
			--ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gpsmenu', {
				title    = '<span style="color:red;">📌 GPS - Menú<span style="color:white;">',
				align    = Config.Alineacion,
				elements = {
			{label = '<span style="color:turquoise;">🅿️ Marcar el Garaje Central<span style="color:white;">', value = 'gpsgaraje'},
			{label = '<span style="color:lightgreen;">💼 Marcar el INEM<span style="color:white;">', value = 'gpsempleo'},
			{label = '<span style="color:lightskyblue;">👮 Marcar la Comisaría de Policía<span style="color:white;">', value = 'gpspolicia'},
			{label = '<span style="color:red;">🏥 Marcar el Hospital<span style="color:white;">', value = 'gpshospital'},
			{label = '<span style="color:slategray;">🔧 Marcar el Mecánico<span style="color:white;">', value = 'gpsmecanico'},
			{label = '<span style="color:tan;">🚗 Marcar el Concesionario<span style="color:white;">', value = 'gpsconcesionario'},
			{label = '<span style="color:orangered;">❌ Quitar el punto marcado en el GPS<span style="color:white;">', value = 'gpsquitar'},
			{label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'gpssalir'}
				}
			}, function(data, menu)
					if data.current.value == 'gpsempleo' then
						SetNewWaypoint(-139.84, 6301.57, 31.49)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has marcado el ~g~INEM~s~.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpsgaraje' then
						SetNewWaypoint(-199.69, 6213.65, 30.84)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has marcado el ~g~Garaje Central~s~.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpspolicia' then
						SetNewWaypoint(-438.23, 6021.79, 31.49)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', '~s~', 'Has marcado la ~b~Comisaría de Policía~s~.', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpshospital' then
						SetNewWaypoint(-244.23, 6328.4, 32.43)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has marcado el ~r~Hospital~s~.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpsmecanico' then
						SetNewWaypoint(117.7, 6615.29, 31.85)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has marcado el ~m~Mecánico~s~.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpsconcesionario' then
						SetNewWaypoint(-248.62, 6211.58, 31.94)
						PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has marcado el ~o~Concesionario~s~.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpsquitar' then
						--ClearGpsPlayerWaypoint() -- Esto elimina la ruta del waypoint marcado, pero el punto no.
						DeleteWaypoint() -- Esto elimina el waypoint marcado.
						
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('GPS', 'Has ~o~eliminado~s~ el punto marcado.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'gpssalir' then				
						ESX.UI.Menu.CloseAll()
					end
			end, function(data, menu)
				menu.close()
			end)

		elseif data.current.value == 'hud' then
			TriggerEvent('strepsils_hud')
		elseif data.current.value == 'hud2' then
			TriggerEvent('strepsils_hud2')
		elseif data.current.value == 'minimapa' then
			TriggerEvent('strepsils_minimapa')
		elseif data.current.value == 'voz' then
			TriggerEvent('strepsils_voz')
		elseif data.current.value == 'id' then
			TriggerEvent('strepsils_id')
		elseif data.current.value == 'fps' then
			TriggerEvent('strepsils_fps')
		elseif data.current.value == 'coord' then
			TriggerEvent('strepsils_coord')
		elseif data.current.value == 'trabajos' then
			TriggerEvent('strepsils_trabajos')
		elseif data.current.value == 'otros' then -- Aquí está puesto el config. //and Config.MenuGPS
			--ESX.UI.Menu.CloseAll()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gpsmenu', {
				title    = '<span style="color:moccasin;">Otros - Menú<span style="color:white;">',
				align    = Config.Alineacion,
				elements = {
			{label = '<span style="color:gold;">🔺 HUD de arriba<span style="color:white;">', value = 'hud2'},
			{label = '<span style="color:yellow;">🔻 HUD de abajo<span style="color:white;">', value = 'hud'},
			{label = '<span style="color:green;">🗺 <span style="color:lightskyblue;">Minimapa<span style="color:white;">', value = 'minimapa'},
			{label = '<span style="color:pink;">🎮 FPS<span style="color:white;">', value = 'fps'},
			{label = '<span style="color:lightgreen;">🔊 Voz<span style="color:white;">', value = 'voz'},
			{label = '<span style="color:moccasin;">📋 ID<span style="color:white;">', value = 'id'},
			{label = '<span style="color:cyan;">⌚️ Tiempo<span style="color:white;">', value = 'tiempo'},
			{label = '<span style="color:blueviolet;">👮️ Trabajos<span style="color:white;">', value = 'trabajos'},
			{label = '<span style="color:brown;">🧾 Lista de jugadores<span style="color:white;">', value = 'scoreboard'},
			{label = '<span style="color:green;">💚 Zonas Seguras <span style="color:white;">/ <span style="color:red;">⚔️ Zonas de Mafias<span style="color:white;">', value = 'zona'},
			{label = '<span style="color:orangered;">🚗 Cuentakilometros<span style="color:white;">', value = 'cuentakilometros'},
			{label = '<span style="color:red;">🚀 Cuentakilometros de carreras<span style="color:white;">', value = 'cuentakilometros_carreras'},
			{label = '<span style="color:orange;">📍 Coordenadas<span style="color:white;">', value = 'coord'},
			{label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'otrossalir'}
				}
			}, function(data, menu)
					if data.current.value == 'coord' then
						TriggerEvent('strepsils_coord')
					elseif data.current.value == 'id' then
						TriggerEvent('strepsils_id')
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'zona' then
						TriggerEvent('strepsils_zona')
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'voz' then
						TriggerEvent('strepsils_voz')
						--ESX.UI.Menu.CloseAll()
					elseif data.current.value == 'hud' then
						TriggerEvent('strepsils_hud')	
					elseif data.current.value == 'scoreboard' then
						TriggerEvent('strepsils_scoreboardtoggle')
					elseif data.current.value == 'hud2' then
						TriggerEvent('strepsils_hud2')
					elseif data.current.value == 'minimapa' then
						TriggerEvent('strepsils_minimapa')
					elseif data.current.value == 'fps' then
						TriggerEvent('strepsils_fps')
					elseif data.current.value == 'tiempo' then
						TriggerEvent('strepsils_tiempoig')
						
					elseif data.current.value == 'trabajos' then
						TriggerEvent('strepsils_trabajos')
						
					elseif data.current.value == 'cuentakilometros' then
						--TriggerEvent('coche:cuentakilometros')
						TriggerEvent('strepsils_cuentakilometros2')
					elseif data.current.value == 'cuentakilometros_carreras' then
						TriggerEvent('coche:cuentakilometros')
					
					elseif data.current.value == 'otrossalir' then				
						ESX.UI.Menu.CloseAll()
					end
			end, function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'cam' then
			TriggerEvent('strepsils_cam')
			TriggerEvent('strepsils_hud')
			TriggerEvent('strepsils_hud2')
			TriggerEvent('strepsils_id')
			TriggerEvent('strepsils_voz')
			TriggerEvent('strepsils_minimapa')
			--TriggerEvent('coche:cuentakilometros')
			TriggerEvent('strepsils_cuentakilometros2')
			TriggerEvent('strepsils_cerrar_cuentakilometros_carreras')
			TriggerEvent('strepsils_zona')
			TriggerEvent('strepsils_cerrar_coords') -- Esto es solo a los que por default estan cerrados
			TriggerEvent('strepsils_cerrar_fps') -- Esto es solo a los que por default estan cerrados
			TriggerEvent('strepsils_trabajos_cerrar')
			TriggerEvent('strepsils_tiempoig')
			--TriggerEvent('strepsils_fuel')
			TriggerEvent('strepsils_drift')
			TriggerEvent('strepsils_scoreboardclose')
		elseif data.current.value == 'gpssalir' then
			ESX.UI.Menu.CloseAll()
		elseif data.current.value == 'todo' then -- Aqui se ponen los que de normal si que estan visibles.
			TriggerEvent('strepsils_hud')
			TriggerEvent('strepsils_hud2')
			TriggerEvent('strepsils_id')
			TriggerEvent('strepsils_voz')
			TriggerEvent('strepsils_minimapa')
			--TriggerEvent('coche:cuentakilometros')
			TriggerEvent('strepsils_cuentakilometros2')
			TriggerEvent('strepsils_cerrar_cuentakilometros_carreras')
			TriggerEvent('strepsils_zona')
			TriggerEvent('strepsils_trabajos_cerrar')
			TriggerEvent('strepsils_cerrar_coords') -- Esto es solo a los que por default estan cerrados
			TriggerEvent('strepsils_cerrar_fps') -- Esto es solo a los que por default estan cerrados
			TriggerEvent('strepsils_tiempoig')
			--TriggerEvent('strepsils_fuel')
			TriggerEvent('strepsils_drift')
			TriggerEvent('strepsils_scoreboardclose')
			--TriggerEvent('strepsils_matricula')
		end
	end, function(data, menu)
		menu.close()
	end)
end
		
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Evento limpiar
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

RegisterNetEvent('strepsils_limpiarhud')
AddEventHandler('strepsils_limpiarhud', function()
	TriggerEvent('strepsils_cerrar_hud')
	--TriggerEvent('strepsils_cerrar_hud2')
	TriggerEvent('strepsils_hud2')
	TriggerEvent('strepsils_cerrar_id')
	TriggerEvent('strepsils_cerrar_voz')
	TriggerEvent('strepsils_cerrar_minimapa')
	TriggerEvent('strepsils_cerrar_cuentakilometros_carreras')
	TriggerEvent('strepsils_cerrar_zona')
	TriggerEvent('strepsils_trabajos_cerrar')
	TriggerEvent('strepsils_cerrar_coords') -- Esto es solo a los que por default estan cerrados
	TriggerEvent('strepsils_cerrar_fps') -- Esto es solo a los que por default estan cerrados
	TriggerEvent('strepsils_cerrar_tiempoig')
	TriggerEvent('strepsils_scoreboardclose')
	TriggerEvent('strepsils_cerrar_cuentakilometros2')
	TriggerEvent('strepsils_cerrar_cam')
end)


RegisterNetEvent('strepsils_hud_na') -- Normalmente abiertos
AddEventHandler('strepsils_hud_na', function()
	TriggerEvent('strepsils_id')
	TriggerEvent('strepsils_tiempoig')
	TriggerEvent('strepsils_voz')
	TriggerEvent('strepsils_hud')
	TriggerEvent('strepsils_minimapa')
	TriggerEvent('strepsils_hud2')
	TriggerEvent('strepsils_zona')
	TriggerEvent('strepsils_abrir_cuentakilometros2')
	--TriggerEvent('coche:cuentakilometros')
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Comando
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬


RegisterCommand("cerrar", function()
    TriggerEvent('strepsils_cerrarbug')
end)

RegisterNetEvent('strepsils_cerrarbug') -- Normalmente abiertos
AddEventHandler('strepsils_cerrarbug', function()
	ESX.UI.Menu.CloseAll()
	TriggerEvent('strepsils_scoreboardclose')
	TriggerEvent('strepsils_cerrar_tracker')
	TriggerEvent('strepsils_cerrar_banco')
	TriggerEvent('strepsils_cerrar_cam')
	TriggerEvent('strepsils_cerrar_vehicleshop')
	TriggerEvent('strepsils_cerrar_altavoz')
	TriggerEvent('strepsils_cerrar_menu_dialog')
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Controles
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Config.Abrir) then --and not IsDead
			OpenHudMenu()
		end
		
	end
end)

--[[ -- Esto es para hacer que con el menu no se activen los intermitentes, pero de momento no consigo que funcione.

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)      
		if IsControlJustReleased(0, Config.Abrir) then
			DisableControlAction(1, 173, true)
			DisableControlAction(1, 174, true)
			DisableControlAction(1, 175, true)
		end
    end
end)
]]

--[[
local ped = PlayerPedId()
local pedCoords = GetEntityCoords(ped)
local dstCheck = #(pedCoords - actionData["position"])

local posicion = actionData["position"].x, actionData["position"].y, actionData["position"].z
								ESX.ShowFloatingHelpNotification("Pulsa ~r~[E]~s~ para acceder al menu de los ~y~vehiculos~s~", actionData["position"] - vector3(0.0, 0.0, 0.0-1.9))
								
local playerCoords = GetEntityCoords(PlayerPedId())
ESX.ShowFloatingHelpNotification('lol', playerCoords)
]]

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Final. Script creado por Aniol0012.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬