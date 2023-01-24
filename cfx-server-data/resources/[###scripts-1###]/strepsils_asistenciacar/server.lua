ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

enableprice = true -- true = mecanic is paid, false = mecanic is free
local price = 2000 -- you may edit this to your liking. if "enableprice = false" ignore this one

--CHEQUEAR DINERO Y PAGAR--

RegisterServerEvent('pagarmecano:checkmoney')
AddEventHandler('pagarmecano:checkmoney', function ()
	if enableprice == true then
		TriggerEvent('es:getPlayerFromId', source, function (user)
			userMoney = user.getMoney()
			if userMoney >= price then
				--user.removeMoney(price) -- De esta forma si no llega el coche no se les cobra
				TriggerClientEvent('pagarmecano:success', source, price)
			else
				moneyleft = price - userMoney
				TriggerClientEvent('pagarmecano:notenoughmoney', source, moneyleft)
			end
		end)
	else
		TriggerClientEvent('pagarmecano:free', source)
	end
end)

RegisterServerEvent('pagarmecano:cobrar')
AddEventHandler('pagarmecano:cobrar', function ()
	TriggerEvent('es:getPlayerFromId', source, function (user)
		userMoney = user.getMoney()
		user.removeMoney(price)
	end)
end)