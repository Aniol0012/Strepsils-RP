ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local sok = 10
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('orchard:job1a')
AddEventHandler('orchard:job1a', function(count)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('jablka').count

	if itemQuantity >= 40 then
		TriggerClientEvent('sadownik:toomuch', source)
	else
		xPlayer.addInventoryItem('jablka', 10)
		TriggerClientEvent('sadownik:anim', source)
	end
end)


RegisterServerEvent('orchard:job1b')
AddEventHandler('orchard:job1b', function(count)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pomarancza').count

	if itemQuantity >= 40 then
		TriggerClientEvent('sadownik:toomuch', source)
	else
		xPlayer.addInventoryItem('pomarancza', 10)
		TriggerClientEvent('sadownik:anim', source)
	end
end)


RegisterServerEvent('orchard:job2')
AddEventHandler('orchard:job2', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pomarancza = xPlayer.getInventoryItem('pomarancza').count
	local jablka = xPlayer.getInventoryItem('jablka').count
	local sok = xPlayer.getInventoryItem('sok').count
		
		
	if pomarancza <= 19 and jablka <= 19 then
		TriggerClientEvent('sadownik:niemasz', source)
		elseif sok > 40 then
			TriggerClientEvent('sadownik:toomuchj', source)
			elseif sok <= 40 and pomarancza >= 20 and jablka >= 20 then 
			xPlayer.removeInventoryItem('jablka', 20)
			xPlayer.removeInventoryItem('pomarancza', 20)
			xPlayer.addInventoryItem('sok', 40)
	end
	end)


--[[local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('sok').count <= 0 then
				sok = 0
			else
				sok = 1
			end
			

		
			if sok == 0 then
				TriggerClientEvent('esx:showNotification', source, '~y~Nie posiadasz soków do ~r~sprzedania')
				return
			else

				if (sok == 1) then
					SetTimeout(10000, function()
						xPlayer.removeInventoryItem('sok', 5)
						xPlayer.addMoney('250') --pieniądze za jaki sprzedajemy sok x5
						Sell(source,zone)

						end)

					end
				end
				
			end
		end
	end]]

RegisterServerEvent('orchard:job3')
AddEventHandler('orchard:job3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local sok = xPlayer.getInventoryItem('sok').count
	
	if sok >= 1 then
	TriggerClientEvent('sadownik:oddajsoki', source)
	else
		TriggerClientEvent('esx:showNotification', source, '~y~Nie posiadasz soków do ~r~sprzedania')
		end
end)

RegisterServerEvent('orchard:job3a')
AddEventHandler('orchard:job3a', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local sok = xPlayer.getInventoryItem('sok').count
	
	if sok >= 1 then
		xPlayer.removeInventoryItem('sok', sok)
		Citizen.Wait(1000)
		xPlayer.addMoney(sok * Config.JuiceSellEarnings)
	else
		TriggerClientEvent('esx:showNotification', source, '~y~Nie posiadasz soków do ~r~sprzedania')
	end
end)

RegisterServerEvent('orchard:job3apple')
AddEventHandler('orchard:job3apple', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local jablka = xPlayer.getInventoryItem('jablka').count
	
	if jablka >= 1 then
		xPlayer.removeInventoryItem('jablka', jablka)
		Citizen.Wait(1000)
		xPlayer.addMoney(jablka * Config.AppleSellEarnings)
	else
		TriggerClientEvent('sadownik:niemasz', source)
	end
end)

RegisterServerEvent('orchard:job3orange')
AddEventHandler('orchard:job3orange', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pomaranacza = xPlayer.getInventoryItem('pomarancza').count
	if pomaranacza >= 1 then
		xPlayer.removeInventoryItem('pomarancza', pomaranacza)
		Citizen.Wait(1000)
		xPlayer.addMoney(pomaranacza * Config.OrangeSellEarnings)
	else
		TriggerClientEvent('sadownik:niemasz', source)
	end
end)

ESX.RegisterUsableItem('pomarancza', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pomaranacza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 40000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Zjadłes pomarańcze')

end)

ESX.RegisterUsableItem('jablka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jablka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Zjadłes jabłka')

end)

ESX.RegisterUsableItem('sok', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sok', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Napiłeś się soku')

end)