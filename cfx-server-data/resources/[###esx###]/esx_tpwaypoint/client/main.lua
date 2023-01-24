local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("tpm", function(source)
    TeleportToWaypoint()
end)

TeleportToWaypoint = function()
    ESX.TriggerServerCallback("esx_tpwaypoint:fetchUserRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                --ESX.ShowNotification("Te has teletransportado")
				local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
				ESX.ShowAdvancedNotification('Tú', '~g~Te has teletransportado', '', mugshotStr, 1)
				UnregisterPedheadshot(mugshot)
            else
                --ESX.ShowNotification("Porfavor coloca un punto")
				local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
				ESX.ShowAdvancedNotification('Tú', '~y~Debes colocar un punto en el mapa antes', '', mugshotStr, 1)
				UnregisterPedheadshot(mugshot)
            end
        else
            --ESX.ShowNotification("No tienes los permisos suficientes")
			local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
			ESX.ShowAdvancedNotification('Tú', '~r~No tienes los permisos suficientes', '', mugshotStr, 1)
			UnregisterPedheadshot(mugshot)
        end
    end)
end