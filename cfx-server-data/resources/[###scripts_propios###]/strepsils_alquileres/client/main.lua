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

local IsMenuOpen = false -- No tocar

local IsMenuOpen3 = false -- No tocar

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- ESX Default
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

ESX              = nil

local PlayerData = {}

cachedData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	while not ESX do

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Función Principal [Alquiler de bicis]
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId(), true)
        for k in pairs(Config.Zones) do
			local distancia = GetDistanceBetweenCoords(Config.Zones[k].x, Config.Zones[k].y, Config.Zones[k].z, coords)
            if distancia < 1 then
                Marker("~w~Pulsa ~g~E~w~ para alquilar un vehículo", 27, Config.Zones[k].x, Config.Zones[k].y, Config.Zones[k].z - 0.99)
                if IsControlJustReleased(0, Keys['E']) then
                    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
						AlquilerSkateMenu()
						IsMenuOpen = true
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '', '~r~No puedes estar dentro de un vehículo.', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
                end
            elseif distancia > 1 and distancia < 5 and IsMenuOpen then
				ESX.UI.Menu.CloseAll()
				IsMenuOpen = false			
			elseif distancia > 1 and distancia < 5 then
                Marker("~g~Alquiler del Skatepark", 27, Config.Zones[k].x, Config.Zones[k].y, Config.Zones[k].z - 0.99)
            end
        end
    end
end)

function AlquilerSkateMenu()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alquilerveh_skate',
        {
            title    = '<span style="color:orange;">🚗 Alquiler del skatepark',
            align    = 'center',
            elements = {
                {label = '<span style="color:dodgerblue">🚲 BMX<span style="color:white">: <span style="color:green"> 30€</span> ', precio = 30,    type = 'bmx'},
                {label = '<span style="color:orange">🛴 Skate<span style="color:white">: <span style="color:green"> 50€</span> ', precio = 50,    type = 'skate'},
   
            }
        }, function(data, menu)
            local selected = data.current.type
			local precio = data.current.precio
			local coords = GetEntityCoords(PlayerPedId())
            if selected == 'bmx' then
          
                ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
                    if money >= precio then
						local vehicle = 'bmx'
						local playerPed = PlayerPedId()
                        ESX.UI.Menu.CloseAll()
						IsMenuOpen = false	
                        if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							ESX.Game.SpawnVehicle(vehicle, coords, 31.51, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
							end)
							
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado una ' .. vehicle .. '.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
						
						end
                    else
                        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
                    end
                end)
			elseif selected == 'skate' then
          
                ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
                    if money >= precio then
                        ESX.UI.Menu.CloseAll()
						IsMenuOpen = false	
                        if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							TriggerEvent("kepo_skateboard:pickUp")
							
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado un skate.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
						
						end
                    else
                        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
                    end
                end)
            end
        end, function(data, menu)
            menu.close() 
    end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Función Principal [Alquiler de bicis normal]
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId(), true)
        for k in pairs(Config.Zones3) do
			local distancia3 = GetDistanceBetweenCoords(Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z, coords)
            if distancia3 < 1 then
                Marker("~w~Pulsa ~g~E~w~ para alquilar una bici", 27, Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z - 0.99)
                if IsControlJustReleased(0, Keys['E']) then
                    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
						AlquilerBicisMenu()
						IsMenuOpen3 = true
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '', '~r~No puedes estar dentro de un vehículo.', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
                end
            elseif distancia3 > 1 and distancia3 < 5 and IsMenuOpen3 then
				ESX.UI.Menu.CloseAll()
				IsMenuOpen3 = false			
			elseif distancia3 > 1 and distancia3 < 5 then
                Marker("~g~Alquiler de bicis", 27, Config.Zones3[k].x, Config.Zones3[k].y, Config.Zones3[k].z - 0.99)
            end
        end
    end
end)

function AlquilerBicisMenu()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'alquilerveh_normal',
        {
            title    = '<span style="color:orange;">🚲 Alquiler de bicis',
            align    = 'center',
            elements = {
                {label = '<span style="color:cyan">1️⃣  Bicicleta de paseo <span style="color:white">[Cruiser]<span style="color:white">: <span style="color:green"> 15€</span> ', precio = 15,    type = 'cruiser'},
				{label = '<span style="color:dodgerblue">2️⃣  Bicicleta BMX<span style="color:white">: <span style="color:green"> 30€</span> ', precio = 30,    type = 'bmx'},
				{label = '<span style="color:khaki">3️⃣  Bicicleta todoterreno <span style="color:white">[Scorcher]<span style="color:white">: <span style="color:green"> 60€</span> ', precio = 60,    type = 'scorcher'},
				{label = '<span style="color:orange">4️⃣  Bicicleta de ciudad <span style="color:white">[Fixter]<span style="color:white">: <span style="color:green"> 100€</span> ', precio = 100,    type = 'fixter'},
   
            }
        }, function(data, menu)
            local selected = data.current.type
			local precio = data.current.precio
			local coords = GetEntityCoords(PlayerPedId())
			local playerPed = PlayerPedId()
			local heading = 225.0
			if selected == 'bmx' then
				ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
					if money >= precio then
						local vehicle = 'bmx'
						ESX.UI.Menu.CloseAll()
						IsMenuOpen3 = false	
						if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
							end)
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado una ' .. vehicle .. '.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
							end
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
				end)
			elseif selected == 'cruiser' then
				ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
					if money >= precio then
						local vehicle = 'cruiser'
						ESX.UI.Menu.CloseAll()
						IsMenuOpen3 = false	
						if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
							end)
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado una ' .. vehicle .. '.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
							end
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
				end)
			elseif selected == 'scorcher' then
				ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
					if money >= precio then
						local vehicle = 'scorcher'
						ESX.UI.Menu.CloseAll()
						IsMenuOpen3 = false	
						if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
							end)
							
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado una ' .. vehicle .. '.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
							end
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
				end)
			elseif selected == 'fixter' then
				ESX.TriggerServerCallback("strepsils_chequeardinero_alquilerveh", function(money)
					if money >= precio then
						local vehicle = 'fixter'
						ESX.UI.Menu.CloseAll()
						IsMenuOpen3 = false	
						if ESX.Game.IsSpawnPointClear(coords, 5.0) then
							TriggerServerEvent("strepsils_quitardinero_alquilerveh", precio)
							ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
							end)
							
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~g~Has alquilado una ' .. vehicle .. '.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)
						else
							local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
							ESX.ShowAdvancedNotification('Tú', '~r~Ya hay vehículos cerca.', '', mugshotStr, 1)
							UnregisterPedheadshot(mugshot)							
							end
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '~r~No tienes suficiente dinero.', '', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
				end)
			end
        end, function(data, menu)
            menu.close() 
    end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Función Secundaria [Eliminador]
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId(), true)
		local jugador = GetPlayerPed(-1)
        for k in pairs(Config.Zones2) do
			local distancia2 = GetDistanceBetweenCoords(Config.Zones2[k].x, Config.Zones2[k].y, Config.Zones2[k].z, coords)
			local current_vehiculo = GetVehiclePedIsIn(jugador, false)
            if distancia2 < 2 and IsPedInAnyVehicle(jugador) then
                Marker2("~w~Pulsa ~g~E~w~ para eliminar el vehículo", 27, Config.Zones2[k].x, Config.Zones2[k].y, Config.Zones2[k].z - 0.99)
                if IsControlJustReleased(0, Keys['E']) then
                    if IsPedInAnyVehicle(jugador) then
                    	if Config.AnimacionAlEliminarVehiculo then
							local vehiculo = GetVehiclePedIsUsing(PlayerPedId())
							TaskLeaveVehicle(PlayerPedId(), vehiculo, 0)
							Wait(2000) -- Me espero a que salga del vehiculo
							ESX.Game.DeleteVehicle(current_vehiculo)
						else
							ESX.Game.DeleteVehicle(current_vehiculo)
						end						
					else
						local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
						ESX.ShowAdvancedNotification('Tú', '', '~r~Debes estar dentro de un vehículo.', mugshotStr, 1)
						UnregisterPedheadshot(mugshot)
					end
				end
			elseif distancia2 > 2 and distancia2 < 15 and IsPedInAnyVehicle(jugador) then
                Marker2("~r~Eliminar vehículo", 27, Config.Zones2[k].x, Config.Zones2[k].y, Config.Zones2[k].z - 0.99)
            end
        end
    end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Final. Script creado por Aniol0012.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬