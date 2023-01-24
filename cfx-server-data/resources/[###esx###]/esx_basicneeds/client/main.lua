ESX          = nil
local IsDead = false
local IsAnimated = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	TriggerEvent('esx_status:set', 'stress', 0)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	TriggerEvent('esx_status:set', 'stress', 0)
	TriggerEvent('esx_status:set', 'drunk', 0)
	

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#FFFF00', -- Aqui puedes cambiar cada cuanto te baja la comida.
		function(status)
			return false
		end, function(status)
			status.remove(75)
		end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0099FF', -- Aqui puedes cambiar cada cuanto te baja el agua.
		function(status)
			return false
		end, function(status)
			status.remove(85)
		end)
		
    TriggerEvent('esx_status:registerStatus', 'stress', 1000000, '#cadfff', 
	function(status)
        return false
    end, function(status)
        --status.add(0.5)
		--status.remove(75)
    end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth
			local stressVal  = 0

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			  TriggerEvent('esx_status:getStatus', 'stress', function(status)
				stressVal = status.val
            end)

            if health ~= prevHealth then
                SetEntityHealth(playerPed, health)
            end

            if stressVal >= 750000 then
                Citizen.Wait(5000)
                --ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.06)
				-- exports['mythic_notify']:SendAlert('error', '¡Estrés alto!', 3000)
            elseif stressVal >= 700000 then
                Citizen.Wait(10000)
                --ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.03)
				-- exports['mythic_notify']:SendAlert('error', '¡Estrés alto!', 3000)
            elseif stressVal >= 600000 then
                Citizen.Wait(15000)
                --ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.02)
				-- exports['mythic_notify']:SendAlert('error', '¡Estrés alto!', 3000)
            elseif stressVal >= 350000 then
                Citizen.Wait(20000)
                --ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.01)
				-- exports['mythic_notify']:SendAlert('error', '¡Estrés alto!', 3000)
            end
        end
    end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_donut' -- Default: prop_cs_burger_01
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
       ped = PlayerPedId()
     if IsPedShooting(ped) then
       --TriggerEvent('esx_status:add', 'stress', 30000) -- Cuando disparas añade 3 puntos
	   --exports['mythic_notify']:SendAlert('error', 'Stresiniz Arttı!', 10000)
	 end
     if IsPedSwimming(ped) then
       --TriggerEvent('esx_status:add', 'stress', 50) -- Cuando nadas añade 2 puntos
	 end
     if IsPedJumping(ped) then
       --TriggerEvent('esx_status:add', 'stress', 50) -- Cuando saltas añade 0.005 puntos
	 end
     if IsPedHurt(ped) then
       --TriggerEvent('esx_status:add', 'stress', 5000) -- Cuando estás herido añade 5 puntos	   
     end
   end
end)
