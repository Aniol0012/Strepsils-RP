local isSpawned = false

RegisterServerEvent('tm1_donreyes:spawnFirstCar')
AddEventHandler('tm1_donreyes:spawnFirstCar',function()
	if isSpawned == false then
		TriggerClientEvent('tm1_donreyes:spawnedFirstCar',source)
		isSpawned = true
	end
end)

RegisterServerEvent('tm1_donreyes:pagar')
AddEventHandler('tm1_donreyes:pagar',function(propina)
	TriggerEvent('es:getPlayerFromId',source, function(user)
			user.addMoney((propina))
	end)
end)