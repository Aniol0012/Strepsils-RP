--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Do not touch any of this files unless you know what are you doing.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬


--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- ESX Default [Do not touch]
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

ESX = nil

playerData, playerLoaded = nil, false

local banks

blips = {}

local showing = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
	end
end)

RegisterNetEvent('pw:characterLoaded')
AddEventHandler('pw:characterLoaded', function(data)
    PW.TriggerServerCallback('pw_banking:server:requestBanks', function(banksdata)
        banks = banksdata
        playerData = data
        playerLoaded = true
        createBlips()
        if showing then
            showing = false
        end
    end)
end)

RegisterNetEvent('pw:characterUnLoaded')
AddEventHandler('pw:characterUnLoaded', function()
    playerLoaded = false
    playerData = nil
    banks = nil
    removeBlips()
    if showing then
        showing = false
    end
end)

RegisterNetEvent('pw_banking:client:syncBanks')
AddEventHandler('pw_banking:client:syncBanks', function(data)
    banks = data
    if showing then
        showing = false
    end
end)

RegisterNetEvent('pw_banking:updateCash')
AddEventHandler('pw_banking:updateCash', function(data)
    if playerLoaded and playerData then
        playerData.cash = data
        currentCash = playerData.cash
    end
end)

function createBlips()
    for k, v in pairs(banks) do
        blips[k] = AddBlipForCoord(tonumber(v.x), tonumber(v.y), tonumber(v.z))
        SetBlipSprite(blips[k], Config.Blip.blipType)
        SetBlipDisplay(blips[k], 4)
        SetBlipScale  (blips[k], Config.Blip.blipScale)
        SetBlipColour (blips[k], Config.Blip.blipColor)
        SetBlipAsShortRange(blips[k], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Blip.blipName))
        EndTextCommandSetBlipName(blips[k])
    end
end

function removeBlips()
    for k, v in pairs(blips) do
        RemoveBlip(v)
    end
    blips = {}
end

function openAccountScreen()
    PW.TriggerServerCallback('pw_banking:getBankingInformation', function(banking)
        if banking ~= nil then
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = banking
            })
        end        
    end)
end

function atmRefresh()
    PW.TriggerServerCallback('pw_banking:getBankingInformation', function(infor)
        SetNuiFocus(true, true)
        SendNUIMessage({
            status = "refreshatm",
            information = infor
        })
    end)
end

RegisterNetEvent('pw_banking:openBankScreen')
AddEventHandler('pw_banking:openBankScreen', function()
    openAccountScreen()
end)

RegisterNetEvent('pw_banking:client:usedMoneyBag')
AddEventHandler('pw_banking:client:usedMoneyBag', function(item)
    local playerCoords = GetEntityCoords(PlayerPedId())
    for k, v in pairs(banks) do 
        if v.bankType == "Paleto" and v.moneyBags ~= nil and v.bankOpen then
            local moneyBagDist = #(playerCoords - vector3(v.moneyBags.x, v.moneyBags.y, v.moneyBags.z))
            if moneyBagDist < 1.0 then
                TriggerEvent('pw:progressbar:progress',
                    {
                        name = 'accessing_atm',
                        duration = 60000,
                        label = 'Cashier Counting Bag',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                    },
                function(status)
                    if not status then
                        TriggerServerEvent('pw_banking:server:unpackMoneyBag', item)
                    end
                end)
            end
        end
    end
end)

local letSleep = true
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        letSleep = true
        if playerLoaded and PW ~= nil then 
            local playerPed = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerPed, true)
            if banks ~= nil then
                for k, v in pairs(banks) do 
                    local bankDist = #(playerCoords - vector3(v.x, v.y, v.z))
                    if bankDist < 3.0 then
                        letSleep = false
                        if v.bankOpen then
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 100, false, true, 2, true, nil, nil, false)
                        else
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
                        end
                        if v.bankType == "Paleto" and v.moneyBags ~= nil then
                            local moneyBagDist = #(playerCoords - vector3(v.moneyBags.x, v.moneyBags.y, v.moneyBags.z))
                            if v.bankOpen then
                                DrawMarker(27, v.moneyBags.x, v.moneyBags.y, v.moneyBags.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 138, 87, 165, 100, false, true, 2, true, nil, nil, false)
                            else
                                DrawMarker(27, v.moneyBags.x, v.moneyBags.y, v.moneyBags.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
                            end
                            if moneyBagDist < 1.0 then
                                if v.bankOpen then
                                    if not showing then 
                                        TriggerServerEvent('pw_items:server:showUsable', true, {"moneybag"})
                                        TriggerEvent('pw_drawtext:showNotification', { title = "PixelWorld Banks", message = "Use [ <span class='text-danger'>MoneyBag</span> ] to deposit cash in", icon = "fad fa-university" })
                                        showing = k..'-moneybag'
                                    end
                                else
                                    if not showing then 
                                        TriggerEvent('pw_drawtext:showNotification', { title = "PixelWorld Banks", message = "<span class='text-danger'>Bank is currently Closed</span>'", icon = "fad fa-university" })
                                        showing = k..'-moneybag'
                                    end
                                end
                            else
                                if showing == k..'-moneybag' then
                                    TriggerServerEvent('pw_items:server:showUsable', false)
                                    TriggerEvent('pw_drawtext:hideNotification')
                                    showing = false
                                end
                            end
                        end
                        if bankDist < 1.0 then
                            if v.bankOpen then
                                if IsControlJustPressed(0, 38) then
                                    openAccountScreen()
                                end
                                if not showing then
                                    TriggerEvent('pw_items:showUsableKeys', true, {{['key'] = "e", ['label'] = "Access Account"}})
                                    TriggerEvent('pw_drawtext:showNotification', { title = "PixelWorld Banks", message = "Press [ <span class='text-danger'>E</span> ] to access your account", icon = "fad fa-university" })
                                    showing = k..'-cashier'
                                end
                            else
                                if not showing then
                                    TriggerEvent('pw_drawtext:showNotification', { title = "PixelWorld Banks", message = "<span class='text-danger'>Bank is currently Closed</span>'", icon = "fad fa-university" })
                                    showing = k..'-cashier'
                                end
                            end
                        else
                            if showing == k..'-cashier' then
                                TriggerEvent('pw_items:showUsableKeys', false)
                                TriggerEvent('pw_drawtext:hideNotification')
                                showing = false
                            end
                        end
                    end
                end
            end
        end
        if letSleep then
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent('pw_banking:transferError')
AddEventHandler('pw_banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('pw_banking:successAlert')
AddEventHandler('pw_banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)

