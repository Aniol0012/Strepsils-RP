ESX              = nil
local Categories = {}
local Vehicles   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'cardealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'cardealer', _U('car_dealer'), 'society_cardealer', 'society_cardealer', 'society_cardealer', {type = 'private'})

Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('d3x_vehicleshop: ^1WARNING^7 plate character count reached, %s/8 characters.'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

MySQL.ready(function()
	Categories     = MySQL.Sync.fetchAll('SELECT * FROM vehicle_categories')
	local vehicles = MySQL.Sync.fetchAll('SELECT * FROM vehicles')

	for i=1, #vehicles, 1 do
		local vehicle = vehicles[i]

		for j=1, #Categories, 1 do
			if Categories[j].name == vehicle.category then
				vehicle.categoryLabel = Categories[j].label
				break
			end
		end

		table.insert(Vehicles, vehicle)
	end

	-- send information after db has loaded, making sure everyone gets vehicle information
	TriggerClientEvent('d3x_vehicleshop:sendCategories', -1, Categories)
	TriggerClientEvent('d3x_vehicleshop:sendVehicles', -1, Vehicles)
end)
	
RegisterServerEvent('d3x_vehicleshop:setVehicleOwned')
AddEventHandler('d3x_vehicleshop:setVehicleOwned', function (vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	}, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, _U('vehicle_belongs', vehicleProps.plate))
	end)
end)

RegisterServerEvent('d3x_vehicleshop:setVehicleOwnedPlayerId')
AddEventHandler('d3x_vehicleshop:setVehicleOwnedPlayerId', function (playerId, vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	}, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', playerId, _U('vehicle_belongs', vehicleProps.plate))
	end) 
end)

RegisterServerEvent('d3x_vehicleshop:addToList')
AddEventHandler('d3x_vehicleshop:addToList', function(target, model, plate)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)
	local dateNow = os.date('%Y-%m-%d %H:%M')

	if xPlayer.job.name ~= 'cardealer' then
		print(('d3x_vehicleshop: %s attempted to add a sold vehicle to list!'):format(xPlayer.identifier))
		return
	end

	MySQL.Async.execute('INSERT INTO vehiclesluxe_sold (client, model, plate, soldby, date) VALUES (@client, @model, @plate, @soldby, @date)', {
		['@client'] = xTarget.getName(),
		['@model'] = model,
		['@plate'] = plate,
		['@soldby'] = xPlayer.getName(),
		['@date'] = dateNow
	})
end)

ESX.RegisterServerCallback('d3x_vehicleshop:buyVehicle', function (source, cb, vehicleModel)
	local xPlayer     = ESX.GetPlayerFromId(source)
	local vehicleData = nil

	for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	if xPlayer.getMoney() >= vehicleData.price then
		xPlayer.removeMoney(vehicleData.price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('d3x_vehicleshop:buyVehicleSociety', function (source, cb, society, vehicleModel)
	local vehicleData = nil

	for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function (account)
		if account.money >= vehicleData.price then
			account.removeMoney(vehicleData.price)

			MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
				['@vehicle'] = vehicleData.model,
				['@price']   = vehicleData.price
			}, function(rowsChanged)
				cb(true)
			end)

		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('d3x_vehicleshop:getCommercialVehicles', function (source, cb)
	MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles ORDER BY vehicle ASC', {}, function (result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name  = result[i].vehicle,
				price = result[i].price
			})
		end

		cb(vehicles)
	end)
end)

RegisterServerEvent('d3x_vehicleshop:setVehicleOwnedSociety')
AddEventHandler('d3x_vehicleshop:setVehicleOwnedSociety', function (society, vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = 'society:' .. society,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
	}, function (rowsChanged)

	end)
end)

ESX.RegisterServerCallback('d3x_vehicleshop:getCategories', function (source, cb)
	cb(Categories)
end)

ESX.RegisterServerCallback('d3x_vehicleshop:getVehicles', function (source, cb)
	cb(Vehicles)
end)

ESX.RegisterServerCallback('d3x_vehicleshop:buyVehicle', function (source, cb, vehicleModel)
	local xPlayer     = ESX.GetPlayerFromId(source)
	local vehicleData = nil
	local bankMoney = xPlayer.getAccount('bank').money
	print(bankMoney)
	for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
	end

	if xPlayer.getMoney() >= vehicleData.price then
		xPlayer.removeMoney(vehicleData.price)
		cb(true)
	else if bankMoney >= vehicleData.price then
		xPlayer.setAccountMoney('bank',bankMoney-vehicleData.price)
		print(xPlayer.getAccount('bank').money)
		cb(true)
	else
		cb(false)
	end
end
end)

RegisterCommand('bank', function(source) 
	local xPlayer     = ESX.GetPlayerFromId(source)
	local bankMoney = xPlayer.getAccount('bank').money

	TriggerClientEvent('chatMessage', source, "Total: "..bankMoney)
end, false)

ESX.RegisterServerCallback('d3x_vehicleshop:resellVehicle', function (source, cb, plate, model)
	local resellPrice = 0

	-- calculate the resell price
	for i=1, #Vehicles, 1 do
		if GetHashKey(Vehicles[i].model) == model then
			resellPrice = ESX.Math.Round(Vehicles[i].price / 100 * Config.ResellPercentage)
			break
		end
	end

	if resellPrice == 0 then
		--print(('d3x_vehicleshop: %s attempted to sell an unknown vehicle!'):format(GetPlayerIdentifiers(source)[1]))
		TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'vermelho', text = 'This car doesn\'t belong to you!'})
		cb(false)
	end

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function (result)
		if result[1] then -- does the owner match?

			local vehicle = json.decode(result[1].vehicle)

			if vehicle.model == model then
				if vehicle.plate == plate then
					xPlayer.addMoney(resellPrice)
					RemoveOwnedVehicle(plate)

					cb(true)
				else
					print(('d3x_vehicleshop: %s Invalid registration!'):format(xPlayer.identifier))
					cb(false)
				end
			else
				print(('d3x_vehicleshop: %s Invalid template!'):format(xPlayer.identifier))
				cb(false)
			end
		end

	end)
end)

RegisterServerEvent('d3x_vehicleshop:addToList')
AddEventHandler('d3x_vehicleshop:addToList', function(target, model, plate)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)
	local dateNow = os.date('%Y-%m-%d %H:%M')

	if xPlayer.job.name ~= 'cardealer' then
		print(('d3x_vehicleshop: %s attempted to add a sold vehicle to list!'):format(xPlayer.identifier))
		return
	end

	MySQL.Async.execute('INSERT INTO vehicles_sold (client, model, plate, soldby, date) VALUES (@client, @model, @plate, @soldby, @date)', {
		['@client'] = xTarget.getName(),
		['@model'] = model,
		['@plate'] = plate,
		['@soldby'] = xPlayer.getName(),
		['@date'] = dateNow
	})
end)

ESX.RegisterServerCallback('d3x_vehicleshop:getPlayerInventory', function (source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({ items = items })
end)

ESX.RegisterServerCallback('d3x_vehicleshop:isPlateTaken', function (source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function (result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('d3x_vehicleshop:retrieveJobVehicles', function (source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function (result)
		cb(result)
	end)
end)

RegisterServerEvent('d3x_vehicleshop:setJobVehicleState')
AddEventHandler('d3x_vehicleshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('d3x_vehicleshop: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

--SCRIPT PARA TRANSFERIR VEÍCULOS
RegisterCommand('transfervehicle', function(source, args)
	
	myself = source
	other = args[1]
	
	if(GetPlayerName(tonumber(args[1])))then
			
	else
			
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
			return
	end
	
	
	local plate1 = args[2]
	local plate2 = args[3]
	local plate3 = args[4]
	local plate4 = args[5]
	
  
	if plate1 ~= nil then plate01 = plate1 else plate01 = "" end
	if plate2 ~= nil then plate02 = plate2 else plate02 = "" end
	if plate3 ~= nil then plate03 = plate3 else plate03 = "" end
	if plate4 ~= nil then plate04 = plate4 else plate04 = "" end
  
  
	local plate = (plate01 .. " " .. plate02 .. " " .. plate03 .. " " .. plate04)

	
	mySteamID = GetPlayerIdentifiers(source)
	mySteam = mySteamID[1]
	myID = ESX.GetPlayerFromId(source).identifier
	myName = ESX.GetPlayerFromId(source).name

	targetSteamID = GetPlayerIdentifiers(args[1])
	targetSteamName = ESX.GetPlayerFromId(args[1]).name
	targetSteam = targetSteamID[1]
	
	MySQL.Async.fetchAll(
        'SELECT * FROM owned_vehicles WHERE plate = @plate',
        {
            ['@plate'] = plate
        },
        function(result)
            if result[1] ~= nil then
                local playerName = ESX.GetPlayerFromIdentifier(result[1].owner).identifier
				local pName = ESX.GetPlayerFromIdentifier(result[1].owner).name
				CarOwner = playerName
				print("Car Transfer ", myID, CarOwner)
				if myID == CarOwner then
					print("Transfered")
					
					data = {}
						TriggerClientEvent('chatMessage', other, "^4El vehículo con matrícula ^*^1" .. plate .. "^r^4se te ha transferido gracias a: ^*^2" .. myName)
			 
						MySQL.Sync.execute("UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate", {['@owner'] = targetSteam, ['@plate'] = plate})
						TriggerClientEvent('chatMessage', source, "^4Has ^*^3transferido^0^4 un vehículo con matrícula ^*^1" .. plate .. "\" ^r^4a ^*^2".. targetSteamName)
				else
					print("Did not transfer")
					TriggerClientEvent('chatMessage', source, "^*^1Este vehículo no te pertenece.")
				end
			else
				TriggerClientEvent('chatMessage', source, "^1^*ERROR: ^r^0Esta matrícula no existe o has escrio mal la matrícula.")
            end
		
        end
    )
	
end)
