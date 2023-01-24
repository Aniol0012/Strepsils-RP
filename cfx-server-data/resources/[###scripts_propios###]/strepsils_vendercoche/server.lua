ESX                = nil
local banned = {}

function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
  end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('cas_vendercoche:cochesbanned', function(source, cb)

	cb(banned) 
end)
  
function coche(vendedor,comprador,matr,price,name)
	local xPlayervend = ESX.GetPlayerFromId(vendedor)
	local xPlayercomp = ESX.GetPlayerFromId(comprador)
	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `owner` = @owner WHERE `owner` = @ownerantiguo AND`vehicle` LIKE "%' .. trim(matr) .. '%"',
		{
			['@owner'] =  GetPlayerIdentifiers(comprador)[1],
			['@ownerantiguo'] = GetPlayerIdentifiers(vendedor)[1]
		}
	)

	registerDB(GetPlayerIdentifiers(vendedor)[1], GetPlayerIdentifiers(comprador)[1], matr, price, name)
	TriggerClientEvent('chatMessage', comprador, "SYSTEM", {255, 0, 0}, "Ahora el coche le pertenece a usted!")
	TriggerClientEvent('chatMessage', vendedor, "SYSTEM", {255, 0, 0}, "Bueno, pues has vendido tu coche")

	xPlayercomp.removeMoney(price)
	xPlayervend.addMoney(price)
end

RegisterServerEvent('cas_vendercoche:esmicoche')
AddEventHandler('cas_vendercoche:esmicoche',function(matr,id,price,car,name)
	local source = source
	local var = false
	local ident = GetPlayerIdentifiers(source)[1]
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = ident})	
	if data[1] then
		for i=1,#data,1 do
			local vehicle = json.decode(data[i].vehicle)
			if trim(tostring(vehicle.plate)) == trim(tostring(matr)) then
				var = true
				break
			end
		end
	end
	TriggerClientEvent('cas_vendercoche:esmicochecallback',source,var,id,price,matr,car,name)
end)

RegisterServerEvent('cas_vendercoche:vendococheser')
AddEventHandler('cas_vendercoche:vendococheser',function(id,precio,matr,car,name)
	TriggerClientEvent('cas_vendercoche:vendocoche',id,precio,source,matr,car,name)
end)

function registerDB(vendedor, comprador, matr, price, name)
local hour = os.time()
local tiempo = os.date('%c',hour)
MySQL.Async.execute("INSERT INTO cas_vendercoche (`seller`,`buyer`,`car`,`hour`,`price`,`name`) VALUES (@vendedor,@comprador,@matr,@hour,@price,@name)", {vendedor = vendedor,comprador = comprador,matr = matr,hour = tiempo,price = price,name = name})
end

RegisterServerEvent('cas_vendercoche:handleroferta')
AddEventHandler('cas_vendercoche:handleroferta',function(var,vendedor,matr,price,name)
	if var == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		if price <= xPlayer.getMoney() then
			TriggerClientEvent('chatMessage', vendedor, "STREPSILS RP", {0, 255, 0}, "¡Han aceptado la oferta!")
			TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "¡Has aceptado la oferta!")
			coche(vendedor,source,matr,price,name)
		else
			TriggerClientEvent('chatMessage', vendedor, "STREPSILS RP", {0, 255, 0}, "¡El comprador no tiene dinero suficiente!")
			TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "No tienes dinero suficiente")
		end
	else
		TriggerClientEvent('chatMessage', vendedor, "STREPSILS RP", {0, 255, 0}, "¡Han rechazado tu oferta!")
		TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "¡Has rechazado la oferta!")
	end
end)

TriggerEvent('es:addCommand', 'vendercoche', function(source, args, user)
	local source = source
	if #args == 1 then
		TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "Debes de poner un precio!")
	else
		if GetPlayerName(tostring(args[1])) then--and tonumber(args[2]) ~= source then
			local id1 = tonumber(args[1])
			local precio = tonumber(args[2])
			if precio <= 0 then TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "El precio no es válido, debe de ser mayor a 0.") return 0 end

			TriggerClientEvent("cas_vendercoche:compruebocoche",source,id1,precio)

		else
			TriggerClientEvent('chatMessage', source, "STREPSILS RP", {0, 255, 0}, "¡La ID es incorrecta!")
		end
	end
end, {help = "Vender un coche a otro jugador", params = {{name = "ID", help = "ID del jugador"},{name = "Precio", help = "Precio"}}})
