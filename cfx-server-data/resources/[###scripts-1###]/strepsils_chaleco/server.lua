ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('chaleco', function(source)
	TriggerClientEvent('esx_kamizelka:zakladanie', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chaleco', 1)
end)