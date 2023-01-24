ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

local toghud = true

RegisterCommand('hud', function(source, args, rawCommand)

    if toghud then 
        toghud = false
    else
        toghud = true
    end

end)

--[[
RegisterCommand('hud', function()

    if toghud then 
        toghud = false
    else
        toghud = true
    end

end)
]]

local minimapaNoVisible = false -- Si se pone en true, por default el minimapa no se verá.

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if minimapaNoVisible then
		    DisplayRadar(0)
		elseif not minimapaNoVisible then
			DisplayRadar(1)
		end
    end
end)

RegisterNetEvent('strepsils_minimapa')
AddEventHandler('strepsils_minimapa', function()
	Toggleminimapa()
end)

Toggleminimapa = function()
	minimapaNoVisible = not minimapaNoVisible
end

RegisterCommand("minimapa", function()
    Toggleminimapa()
end)

-- TriggerEvent('strepsils_hud')

RegisterNetEvent('strepsils_cerrar_hud')
AddEventHandler('strepsils_cerrar_hud', function()
	if toghud then
		toghud = false
	end
end)

RegisterNetEvent('strepsils_cerrar_minimapa')
AddEventHandler('strepsils_cerrar_minimapa', function()
	if not minimapaNoVisible then
		minimapaNoVisible = true
	end
end)



RegisterNetEvent('strepsils_hud')
AddEventHandler('strepsils_hud', function()
	if toghud then 
        toghud = false
    else
        toghud = true
    end
end)

Citizen.CreateThread(function()
    while true do

        if toghud == true then
            if (not IsPedInAnyVehicle(PlayerPedId(), false) )then
                --DisplayRadar(1) -- Si quieres que si no vas en coche no haya minimapa, pon este y el de la linea 49 (Es decir, el primero y el tercero) en 0
            else
                --DisplayRadar(1)
            end
        else
            --DisplayRadar(1)
        end 
        
        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                TriggerEvent('esx_status:getStatus','stress',function(stress)

                    local myhunger = hunger.getPercent()
                    local mythirst = thirst.getPercent()
                    local mystress = stress.getPercent()

                    SendNUIMessage({
                        action = "updateStatusHud",
                        show = toghud,
                        hunger = myhunger,
                        thirst = mythirst,
                    })
                end)
            end)
        end)
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local player = PlayerPedId()
        local health = (GetEntityHealth(player) - 100)
        local armor = GetPedArmour(player)
        local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10 -- Aquí puedes cambiar en segundos el tiempo que quieres que se tarde en ahogarse alguien.
		local stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())

        SendNUIMessage({
            action = 'updateStatusHud',
            show = toghud,
            health = health,
            armour = armor,
            oxygen = oxy,
			stamina = stamina,
        })
        Citizen.Wait(200)
    end
end)

--[[
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
 #Author: Aniol0012
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
]]
