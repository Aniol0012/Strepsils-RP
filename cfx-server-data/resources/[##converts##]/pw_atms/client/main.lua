PW = nil
playerData, playerLoaded = nil, false

Citizen.CreateThread(function()
	while PW == nil do
		TriggerEvent('pw:getSharedObject', function(obj) PW = obj end)
        Citizen.Wait(1)
	end
end)

RegisterNetEvent('pw:characterLoaded')
AddEventHandler('pw:characterLoaded', function(data)
    playerData = data
    playerLoaded = true
end)

RegisterNetEvent('pw:characterUnLoaded')
AddEventHandler('pw:characterUnLoaded', function()
    playerLoaded = false
    playerData = nil
end)

RegisterNUICallback("NUIFocusOff", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closeATM"
    })
end)

RegisterNUICallback("playATMAnim", function(data, cb)
    local playerPed = GetPlayerPed(-1)
    local anim = 'amb@prop_human_atm@male@idle_a'
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Citizen.Wait(1)
    end

    if HasAnimDictLoaded(anim) then 
        TaskPlayAnim(GetPlayerPed(-1), anim, "idle_a", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end


end)

RegisterNUICallback("doATMWithdraw", function(data, cb)
    if data ~= nil then
        TriggerServerEvent('pw_atms:server:doAccountWithdraw', data)
    end
end)

RegisterNetEvent('pw_atms:client:updateBankInformation')
AddEventHandler('pw_atms:client:updateBankInformation', function(banking)
    SendNUIMessage({
        status = "loadBankAccount",
        information = banking
    })
end)

function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end 

RegisterNUICallback("loadBankingAccount", function(data, cb)
    PW.TriggerServerCallback('pw_atms:server:loadBankAccount', function(banking)
        if banking ~= false and type(banking) == "table" then
            SendNUIMessage({
                status = "loadBankAccount",
                information = banking
            })
        else
            SetNuiFocus(false, false)
            SendNUIMessage({
                status = "closeATM"
            })
        end
    end, tonumber(data.cid), tonumber(data.cardnumber))
end)

RegisterNetEvent('pw_atms:client:loadATM')
AddEventHandler('pw_atms:client:loadATM', function()
    PW.TriggerServerCallback('pw_debitcard:server:requestCards', function(cards)
        if cards ~= nil and cards[1] ~= nil then
            local playerPed = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerPed, true)
            for k, v in pairs(Config.ATMModels) do
            local hash = GetHashKey(v)
            local atm = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.2)
            if atm then 
                local obj = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 2.0, hash, false, false, false)
                local atmCoords = GetEntityCoords(obj, false)
                TriggerEvent("pw:progressbar:progress", {
                    name = "accessing_atm",
                    duration = 1500,
                    label = "Accessing ATM",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    },
                }, function(status)
                    if not status then
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            status = "openATMFrontScreen",
                            cards = cards,
                        })
                    end
                end)
                end
            end     
        else
            exports['pw_notify']:SendAlert('error', 'You do not have a debit card to pay with, please visit a branch to order a card. or ensure one is on your person.', 5000)
        end
    end)
end)