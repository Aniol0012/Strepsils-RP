ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'weazelnews', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'weazelnews', 'Karting', 'society_weazelnews', 'society_weazelnews', 'society_weazelnews', {type = 'private'})

----------------------------------
---- Ajout Gestion Stock Boss ----
----------------------------------

RegisterServerEvent('sp_weazelnews:getStockItem')
AddEventHandler('sp_weazelnews:getStockItem', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_weazelnews', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('sp_weazelnews:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_weazelnews', function(inventory)
    cb(inventory.items)
  end)

end)

-------------
-- AJOUT 2 --
-------------

RegisterServerEvent('sp_weazelnews:putStockItems')
AddEventHandler('sp_weazelnews:putStockItems', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_weazelnews', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

--ESX.RegisterServerCallback('sp_weazelnews:putStockItems', function(source, cb)

--  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_policestock', function(inventory)
--    cb(inventory.items)
--  end)

--end)

ESX.RegisterServerCallback('sp_weazelnews:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

RegisterServerEvent('sp_weazelnews:annonce')
AddEventHandler('sp_weazelnews:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('sp_weazelnews:annonce', xPlayers[i],text)
  end

  Wait(8000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('sp_weazelnews:annoncestop', xPlayers[i])
  end

end)

RegisterNetEvent('Cam:ToggleCam')
AddEventHandler('Cam:ToggleCam', function()
    local src = source
    TriggerClientEvent("Cam:ToggleCam", src)
end)

RegisterNetEvent('Mic:ToggleBMic')
AddEventHandler('Mic:ToggleBMic', function()
    local src = source
    TriggerClientEvent("Mic:ToggleBMic", src)
end)

RegisterNetEvent('Mic:ToggleMic')
AddEventHandler('Mic:ToggleMic', function()
    local src = source
    TriggerClientEvent("Mic:ToggleMic", src)
end)

local lastAdDate 			   = 0

RegisterServerEvent("SyncWerbung")
AddEventHandler('SyncWerbung', function(inputText)
	if os.time(os.date("!*t")) > (lastAdDate + 1800) then
		lastAdDate = os.time(os.date("!*t"))
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerClientEvent('DisplayWerbung', -1, inputText, xPlayer.getName())
				PerformHttpRequest(Config.Webhook, function(e,r,h) end, "POST", json.encode({
					["username"] = "Weazel News",
					["content"] = "```diff\n+ [Weazel News] " .. xPlayer.name .. " has placed advertising: " .. inputText .."```"
				}), {["Content-Type"] = "application/json"})
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeMoney(80)
		TriggerClientEvent("notifications", -1, "#fc8c03", "Justice", "This is a test of your biscuit")
	else
		TriggerClientEvent('FehlerWerbung', source, "Ads have been running for the past 30 minutes.")
	end
end)

------------------------------------------------
-- discord shop : https://discord.gg/3wwzfmf  --
-- discord leaks : https://discord.gg/39mJqPU --
--                SP#5201                     --               
------------------------------------------------           
