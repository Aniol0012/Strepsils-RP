ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local codes = {
    
}
RegisterServerEvent('tm1_hacking:addItem')
AddEventHandler('tm1_hacking:addItem', function(name,price)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(name,price)
end)

RegisterServerEvent('tm1_hacking:paperCode')
AddEventHandler('tm1_hacking:paperCode', function(name,price)
        local xPlayer = ESX.GetPlayerFromId(source)
        local piezes = xPlayer.getInventoryItem('paper')
        if piezes.count >= 1 then
            xPlayer.removeInventoryItem('paper',1)	
            local localCode = math.random(1000000,10000000)
            table.insert(codes, "PAPR"..localCode)
            TriggerClientEvent('tm1_hacking:paperSuccessFull',source,"PAPR"..localCode)
        else
            TriggerClientEvent('esx:showNotification', source, "No tienes lo que me interesa.")
        end
end)
RegisterServerEvent('tm1_hacking:getCode')
AddEventHandler('tm1_hacking:getCode', function(code)
    for i,v in ipairs(codes) do
        if code == v then
            if not (string.find( code, "PAPR" ) == nil) then
                local number = math.random(1,5)
                local xPlayer = ESX.GetPlayerFromId(source)
                xPlayer.addInventoryItem('pastilla',number)
                v = nil
            end
        end
    end
end)

ESX.RegisterUsableItem('pastilla', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pastilla', 1)
	TriggerClientEvent('tm1_hacking:pastilla',source)
end)