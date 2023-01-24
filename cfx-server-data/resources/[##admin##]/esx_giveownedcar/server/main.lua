ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--give car with a random plate- 1: carModel (2: playerID)
TriggerEvent('es:addGroupCommand', 'darcoche', 'superadmin', function(source, args, user)
	if args[2] ~= nil then
		local playerName = GetPlayerName(args[2])
		TriggerClientEvent('esx_giveownedcar:spawnVehicle',source,args[1],args[2],playerName,'player')
	else
		local sourceID = source
		local playerName = GetPlayerName(sourceID)
		TriggerClientEvent('esx_giveownedcar:spawnVehicle',source,args[1],sourceID,playerName,'player')
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'Permisos insuficientes.' } })
end, {help = 'Dar un vehículo con matrícula aleatoria', params = {{name = "car", help = 'Modelo del vehículo'}, {name = "id", help = 'La ID del jugador (por defecto es la tuya)'}}})

RegisterCommand('_darcoche', function(source, args)
    if source == 0 then		
		if args[2] ~= nil then
			local sourceID = args[2]
			local playerName = GetPlayerName(sourceID)
			TriggerClientEvent('esx_giveownedcar:spawnVehicle',sourceID,args[1],args[2],playerName,'console')			
		else
			print('ERROR: you need type playerID')			
		end				
	end
end)

RegisterServerEvent('esx_giveownedcar:printToConsole')
AddEventHandler('esx_giveownedcar:printToConsole', function(msg)
	print(msg)
end)

--give car with custom plate- 1: carModel 2: plate (3: playerID)
TriggerEvent('es:addGroupCommand', 'darcochematricula', 'superadmin', function(source, args, user)
	if args[1] == nil then
		TriggerClientEvent('esx:showNotification', source, '~r~/givecarplate [modelo] [matrícula] [ID del jugador]')
	else
		if args[2] == nil then
			TriggerClientEvent('esx:showNotification', source, _U('none_plate'))
		else
			if args[3] ~= nil then
				local playerName = GetPlayerName(args[3])
				TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',source,args[1],args[2],args[3],playerName,'player')
			else
				local sourceID = source
				local playerName = GetPlayerName(sourceID)
				TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',source,args[1],args[2],sourceID,playerName,'player')
			end
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'Permisos insuficientes.' } })
end, {help = 'Dar un vehículo con la matrícula personalizada', params = {{name = "car", help = 'Modelo del coche'}, {name = "plate", help = 'La matrícula'}, {name = "id", help = 'La ID del jugador (por defecto es la tuya)'}}})

RegisterCommand('_darcochematricula', function(source, args)
    if source == 0 then	
		if args[1] == nil then
			print('ERROR: _givecar [carModel] [plate] [playerID]')
		else
			if args[2] == nil then
				print('ERROR: you need type car plate')
			else
				if args[3] ~= nil then
					local sourceID = args[3]
					local playerName = GetPlayerName(sourceID)
					TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',sourceID,args[1],args[2],args[3],playerName,'console')
				else
					print('ERROR: you need type playerID')
				end
			end		
		end
	end
end)

RegisterServerEvent('esx_giveownedcar:setVehicle')
AddEventHandler('esx_giveownedcar:setVehicle', function (vehicleProps, playerID)
	local _source = playerID
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@stored']  = 1
	}, function ()
		if Config.ReceiveMsg then
			TriggerClientEvent('esx:showNotification', _source, _U('received_car', string.upper(vehicleProps.plate)))
		end
	end)
end)


--delete car by plate
TriggerEvent('es:addGroupCommand', 'eliminarcoche', 'superadmin', function(source, args, user)	
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = args[1]
	})
	TriggerClientEvent('esx:showNotification', source, _U('del_car', args[1]))
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'Permisos insuficientes.' } })
end, {help = 'Eliminar un vehículo del garaje por su matrícula', params = {{name = "plate", help = 'La matrícula'}}})

RegisterCommand('_eliminarcoche', function(source, args)
    if source == 0 then
		MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
			['@plate'] = args[1]
		})
		print('Deleted Car Plate: ' ..args[1])
	end
end)