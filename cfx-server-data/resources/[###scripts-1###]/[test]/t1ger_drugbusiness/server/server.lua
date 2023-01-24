-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Get Purchased Labs:
ESX.RegisterServerCallback('t1ger_drugbusiness:getTakenLabs',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local takenLabs = {}
    MySQL.Async.fetchAll("SELECT labID FROM t1ger_druglabs",{}, function(data)
        for k,v in pairs(data) do
            table.insert(takenLabs,{id = v.labID})
        end
        cb(takenLabs)
    end)
end)

-- Purchase Drug Lab:
ESX.RegisterServerCallback('t1ger_drugbusiness:buyDrugLab',function(source, cb, id, val)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = 0
    if Config.PayDrugLabWithCash then
        money = xPlayer.getMoney()
    else
        money = xPlayer.getAccount('bank').money
    end
	if money >= val.price then
		if Config.PayDrugLabWithCash then
			xPlayer.removeMoney(val.price)
		else
			xPlayer.removeAccountMoney('bank', val.price)
		end
        --MySQL.Async.execute("UPDATE users SET labID=@labID WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@labID'] = id}) 
        MySQL.Sync.execute("INSERT INTO t1ger_druglabs (identifier, labID) VALUES (@identifier, @labID)", {['identifier'] = xPlayer.identifier, ['labID'] = id})
        cb(true)
    else
        cb(false)
    end
end)

-- Sell Drug Lab:
ESX.RegisterServerCallback('t1ger_drugbusiness:sellDrugLab',function(source, cb, id, val, sellPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT labID FROM t1ger_druglabs WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(data)
        if data[1].labID ~= nil then 
            if data[1].labID == id then
                --MySQL.Async.execute("UPDATE users SET labID=@labID WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@labID'] = 0}) 
                MySQL.Async.execute("DELETE FROM t1ger_druglabs WHERE labID=@labID", {['@labID'] = id}) 
                if Config.RecieveSoldLabCash then
                    xPlayer.addMoney(sellPrice)
                else
                    xPlayer.addAccountMoney('bank',sellPrice)
                end
                cb(true)
            else
                cb(false)
            end
        end
    end)
end)

-- Get Supplies:
ESX.RegisterServerCallback('t1ger_drugbusiness:getSupplies',function(source, cb, plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT supplies FROM t1ger_druglabs WHERE labID = @labID", {['@labID'] = plyLabID}, function(data)
        if data[1].supplies ~= nil then
            local supplies = data[1].supplies
            cb(supplies)
        else
            cb(nil)
        end
    end)
end)

-- Get Stock:
ESX.RegisterServerCallback('t1ger_drugbusiness:getStock',function(source, cb, plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT stock FROM t1ger_druglabs WHERE labID = @labID", {['@labID'] = plyLabID}, function(data)
        if data[1].stock ~= nil then
            local stock = data[1].stock
            cb(stock)
        end
    end)
end)

-- Buy Supplies:
ESX.RegisterServerCallback('t1ger_drugbusiness:buySupplies',function(source, cb, plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT supplies FROM t1ger_druglabs WHERE labID = @labID", {['@labID'] = plyLabID}, function(data)
        if data[1].supplies ~= nil then
            local supplies = data[1].supplies
            if supplies < 5 then
                local maxSupplies = (5 - supplies) 
                local priceSupplyLevel = (maxSupplies * Config.SupplyLevelPrice)
                local money = xPlayer.getAccount('bank').money
                if money >= priceSupplyLevel then
                    xPlayer.removeAccountMoney('bank', priceSupplyLevel)
                    TriggerClientEvent('t1ger_drugbusiness:ShowNotifyESX', xPlayer.source, (Lang['supplies_purchased']:format(maxSupplies,priceSupplyLevel)))
                    -- UPDATE DATABASE:
                    MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies WHERE labID = @labID", {
                        ['@supplies'] = 5,
                        ['@labID'] = plyLabID
                    })
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(nil)
            end
        end
    end)
end)

-- Alert on raid/robbery
RegisterServerEvent('t1ger_drugbusiness:alertLabOwner')
AddEventHandler('t1ger_drugbusiness:alertLabOwner', function(plyLabID, type)
    local target = nil
    MySQL.Async.fetchAll("SELECT identifier FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
        if data[1] ~= nil then
            local  targetIdentifier = data[1].identifier
            Wait(200)
            target = ESX.GetPlayerFromIdentifier(targetIdentifier)
            if type == "police" then
                TriggerClientEvent('t1ger_drugbusiness:ShowNotifyESX', target.source, Lang['lab_raid_on_going'])
            elseif type == "player" then
                TriggerClientEvent('t1ger_drugbusiness:ShowNotifyESX', target.source, Lang['lab_robbery_in_progress'])
            end
        else
            print("error [t1ger_drugbusiness:alertLabOwner]")
        end
    end)
end)

-- Seize Supplies and Stock
RegisterServerEvent('t1ger_drugbusiness:seizeStockSupplies')
AddEventHandler('t1ger_drugbusiness:seizeStockSupplies', function(plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- GET TARGET PLAYER:
    local target = nil
    MySQL.Async.fetchAll("SELECT identifier FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(user)
        if user[1].identifier ~= nil then
            local  targetIdentifier = user[1].identifier
            Wait(200)
            target = ESX.GetPlayerFromIdentifier(targetIdentifier)
            if target ~= nil then
                MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
                    if data[1] ~= nil then
                        MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                            ['@supplies'] = 0,
                            ['@stock'] = 0,
                            ['@labID'] = plyLabID
                        })
                    end
                end)
            else
                if Config.RaidLabWhenPlayerOffline then
                    MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
                        if data[1] ~= nil then
                            MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                                ['@supplies'] = 0,
                                ['@stock'] = 0,
                                ['@labID'] = plyLabID
                            })
                        end
                    end)
                else
                    print("player offline [t1ger_drugbusiness:seizeStockSupplies]")
                end
            end
        else
            print("error [t1ger_drugbusiness:seizeStockSupplies]")
        end
    end)
end)

-- Rob Supplies and Stock
RegisterServerEvent('t1ger_drugbusiness:robStockSupplies')
AddEventHandler('t1ger_drugbusiness:robStockSupplies', function(targetID, plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- GET TARGET PLAYER:
    local target = nil
    MySQL.Async.fetchAll("SELECT identifier FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = targetID}, function(user)
        local  targetIdentifier = user[1].identifier
        Wait(200)
        target = ESX.GetPlayerFromIdentifier(targetIdentifier)
        if target ~= nil then
            local stock = 0
            local supplies = 0
            MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = targetID}, function(data)
                if data[1] ~= nil then
                    stock = data[1].stock
                    supplies = data[1].supplies
                    MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                        ['@supplies'] = 0,
                        ['@stock'] = 0,
                        ['@labID'] = targetID
                    })
                end
                MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(newData)
                    if newData[1] ~= nil then
                        local newStock = 0
                        local newSupplies = 0
                        if (newData[1].stock + stock) >= 5 then
                            newStock = 5
                        else
                            newStock = newData[1].stock + stock
                        end
                        if (newData[1].supplies + supplies) >= 5 then
                            newSupplies = 5
                        else
                            newSupplies = newData[1].supplies + supplies
                        end
                        MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                            ['@supplies'] = newSupplies,
                            ['@stock'] = newStock,
                            ['@labID'] = plyLabID
                        })
                    end
                end)
            end)
        else
            if Config.RobLabWhenPlayerOffline then 
                local stock = 0
                local supplies = 0
                MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = targetID}, function(data)
                    if data[1] ~= nil then
                        stock = data[1].stock
                        supplies = data[1].supplies
                        MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                            ['@supplies'] = 0,
                            ['@stock'] = 0,
                            ['@labID'] = targetID
                        })
                    end
                    MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(newData)
                        if newData[1] ~= nil then
                            local newStock = 0
                            local newSupplies = 0
                            if (newData[1].stock + stock) >= 5 then
                                newStock = 5
                            else
                                newStock = newData[1].stock + stock
                            end
                            if (newData[1].supplies + supplies) >= 5 then
                                newSupplies = 5
                            else
                                newSupplies = newData[1].supplies + supplies
                            end
                            MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                                ['@supplies'] = newSupplies,
                                ['@stock'] = newStock,
                                ['@labID'] = plyLabID
                            })
                        end
                    end)
                end)
            else
                print("player not online [t1ger_drugbusiness:robStockSupplies]")
            end
        end
    end)
end)

-- Convert Supplies to Stock
RegisterServerEvent('t1ger_drugbusiness:suppliesToStock')
AddEventHandler('t1ger_drugbusiness:suppliesToStock', function(plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
        if data[1] ~= nil then
            local supplies = data[1].supplies
            local stock = data[1].stock
            if supplies > 0 and stock < 5 then
                supplies = supplies - 1
                stock = stock + 1
                MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies, stock = @stock WHERE labID = @labID", {
                    ['@supplies'] = supplies,
                    ['@stock'] = stock,
                    ['@labID'] = plyLabID
                })
            else
                if stock >= 5 then
                elseif supplies <= 0 then
                end
            end
        end
    end)
end)

-- Police Notification:
RegisterServerEvent('t1ger_drugbusiness:PoliceNotifySV')
AddEventHandler('t1ger_drugbusiness:PoliceNotifySV', function(targetCoords, streetName)
	TriggerClientEvent('t1ger_drugbusiness:PoliceNotifyCL', -1,string.format((Lang['police_notify']:format(streetName))))
	TriggerClientEvent('t1ger_drugbusiness:PoliceNotifyBlip', -1, targetCoords)
end)

-- Job Reward:
RegisterServerEvent('t1ger_drugbusiness:jobReward')
AddEventHandler('t1ger_drugbusiness:jobReward',function(plyLabID)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT supplies FROM t1ger_druglabs WHERE labID = @labID",{['@labID'] = plyLabID}, function(data)
        if data[1] ~= nil then
            -- Get Current Supplies:
            local supplies = data[1].supplies
            -- Check Supplies
            if supplies < 5 then
                -- Add Supplies Level:
                supplies = supplies + 1
                -- UPDATE DATABASE:
                MySQL.Sync.execute("UPDATE t1ger_druglabs SET supplies = @supplies WHERE labID = @labID", {
                    ['@supplies'] = supplies,
                    ['@labID'] = plyLabID
                })
            end
        end
    end)
end)

-- Stock Sale:
RegisterServerEvent('t1ger_drugbusiness:stockSaleSV')
AddEventHandler('t1ger_drugbusiness:stockSaleSV',function(plyLabID, stockLevel, stockValue)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(stockValue)
    TriggerClientEvent('t1ger_drugbusiness:ShowNotifyESX', xPlayer.source, (Lang['stock_sold_success']:format(stockValue)))
end)