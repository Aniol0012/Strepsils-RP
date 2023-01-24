PW = nil
playerData, playerLoaded = nil, false

Citizen.CreateThread(function()
	while PW == nil do
		TriggerEvent('pw:getSharedObject', function(obj) PW = obj end)
		Citizen.Wait(0)
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
        status = "closePin"
    })
end)

RegisterNUICallback("pinSuccess", function(data, cb)
    if data ~= nil then
        TriggerServerEvent('pw_debitcard:server:autherisePayment', data)
    end
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

RegisterNetEvent('pw_debitcard:openPinTerminal')
AddEventHandler('pw_debitcard:openPinTerminal', function(trigger, ttype, amount, data)
    PW.TriggerServerCallback('pw_debitcard:server:requestCards', function(cards)
        if cards ~= nil and cards[1] ~= nil then
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "populateCards",
                cards = cards,
                reqamount = amount,
                trigger = trigger,
                type = ttype,
                data = data,
                statement = statementText
            })
        else
            exports['pw_notify']:SendAlert('error', 'You do not have a debit card to pay with, please visit a branch to order a card. or ensure one is on your person.', 5000)
        end
    end)
end)

