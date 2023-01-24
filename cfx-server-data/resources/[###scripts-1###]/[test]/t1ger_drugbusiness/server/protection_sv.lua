-- Get & Apply Player Lab ID:
RegisterServerEvent('t1ger_drugbusiness:getPlyLabs')
AddEventHandler('t1ger_drugbusiness:getPlyLabs', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT labID FROM t1ger_druglabs WHERE identifier = @identifier",{['@identifier'] = xPlayer.identifier}, function(data)
        local labID = 0
        if data[1] ~= nil then
            labID = data[1].labID
        end
        TriggerClientEvent('t1ger_drugbusiness:applyPlyLabID', xPlayer.source, labID)
    end)
end)

-- STEAL SUPPLIES:
RegisterServerEvent('t1ger_drugbusiness:JobDataSV')
AddEventHandler('t1ger_drugbusiness:JobDataSV',function(data)
    TriggerClientEvent('t1ger_drugbusiness:JobDataCL',-1,data)
end)

-- SELL STOCK:
RegisterServerEvent('t1ger_drugbusiness:SellJobDataSV')
AddEventHandler('t1ger_drugbusiness:SellJobDataSV',function(data)
    TriggerClientEvent('t1ger_drugbusiness:SellJobDataCL',-1,data)
end)

-- Remove Stock:
RegisterServerEvent('t1ger_drugbusiness:removeStock')
AddEventHandler('t1ger_drugbusiness:removeStock',function(plyLabID, stockLevel)
    MySQL.Async.fetchAll("SELECT stock FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
        if data[1].stock ~= nil then
            local stock = data[1].stock
            MySQL.Sync.execute("UPDATE t1ger_druglabs SET stock = @stock WHERE labID = @labID", {
                ['@stock'] = 0,
                ['@labID'] = plyLabID
            })
        end
    end)
end)


