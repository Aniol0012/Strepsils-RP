ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--[[ Eventos

RegisterServerEvent('taxi_en_camino')
AddEventHandler('taxi_en_camino', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'TEST', '~y~TEST2', '~g~🚕  ¡TEST3!', 'CHAR_TAXI', 8)
	end
end)

]]

RegisterCommand("autopilot", function(source, args, raw)
    local src = source
    TriggerClientEvent("autopilot:start", src)
end)