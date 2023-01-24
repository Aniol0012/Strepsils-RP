---------------------------------------------------
--SISTEMA ADMINISTRATIVO HECHO POR THEMAYKELLLL1--
--     TODOS LOS DERECHOS DE USO RESERVADOS     --
---------------------------------------------------
local ranks = {}
local playersRank = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--Esta función sirve para retornar todos los permisos
function getRanks()
	local ranksMysql = MySQL.Sync.fetchAll("SELECT * FROM tm1_permissions")
	for i,v in pairs(ranksMysql) do
		local permissions = json.decode(v.permissions)
		ranks[v.Id] = permissions
	end
end

--Esta funciónn sirve para devolver el nivel de permiso
function getPermissionLevel(source)
	local license = GetPlayerIdentifiers(source)[2]
	local permission_level = nil
	local data = MySQL.Sync.fetchAll("SELECT * FROM users WHERE license = @license", {['@license'] = license})
	if data[1] then
		permission_level = data[1].permission_level
	end
	return permission_level
end

--Función que retorna si tiene permisos para ejecutar la acción
function isItAvaliable(source,permission)
	for i,v in pairs(ranks[playersRank[source]]) do
		if v == permission then
			return true
		end
	end
end

Citizen.CreateThread(function()
	Citizen.Wait(500)
	getRanks()
end)

--Este evento setea en cliente el nivel del permiso
RegisterServerEvent('tm1_adminSystem:getPermissionLevel')
AddEventHandler('tm1_adminSystem:getPermissionLevel', function()
	local source = source
	playersRank[source] = getPermissionLevel(source)
	TriggerClientEvent('tm1_adminSystem:setPermissionLevel',source,playersRank[source],ranks)
end)

RegisterServerEvent('tm1_adminSystem:noclip')
AddEventHandler('tm1_adminSystem:noclip', function(permission)
	local source = source
	if isItAvaliable(source,permission) == true then
		TriggerClientEvent('tm1_adminSystem:nocliped',source)
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:godmode')
AddEventHandler('tm1_adminSystem:godmode', function(permission)
	local source = source
	if isItAvaliable(source,permission) == true then
		TriggerClientEvent('tm1_adminSystem:godmoded',source)
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:vanish')
AddEventHandler('tm1_adminSystem:vanish', function(permission)
	local source = source
	if isItAvaliable(source,permission) == true then
		TriggerClientEvent('tm1_adminSystem:vanished',source)
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:clearChat')
AddEventHandler('tm1_adminSystem:clearChat', function(permission)
	if isItAvaliable(source,permission) == true then
		TriggerClientEvent('chat:clear', -1)
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:setJob')
AddEventHandler('tm1_adminSystem:setJob', function(permission, args)
	local source = source
	if isItAvaliable(source,permission) == true then
		if args[1] and args[2] and args[3] then
			if tonumber(args[1]) and args[2] and tonumber(args[3]) then
				local xPlayer = ESX.GetPlayerFromId(args[1])
		
				if xPlayer then
					xPlayer.setJob(args[2], tonumber(args[3]))
				else
					TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
				end
			else
				TriggerClientEvent('esx:showNotification',source, "Así no se usa.")
			end
		else
			TriggerClientEvent('esx:showNotification',source, "Faltan parámetros.")
		end
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:clearInventory')
AddEventHandler('tm1_adminSystem:clearInventory', function(permission, target)
	local source = source
	if isItAvaliable(source,permission) == true then
		local xPlayer

		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			xPlayer = ESX.GetPlayerFromId(source)
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end

		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end

		TriggerClientEvent('esx:showNotification',source, "Inventario ~g~borrado.")
	else

	end
end)

RegisterServerEvent('tm1_adminSystem:bring')
AddEventHandler('tm1_adminSystem:bring', function(permission, target, option)
	local source = source
	local target = target
	if isItAvaliable(source,permission) == true then
		local xPlayer
		
		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			TriggerClientEvent('esx:showNotification',source, "Introduce un parámetro.")
			return
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end
		
		if option == -1 then
			TriggerClientEvent('esx:showNotification',source, "Te has teletransportado  ~g~correctamente~w~.")
			TriggerEvent("es:getPlayerFromId", tonumber(target), function(user)
				if user then
					TriggerClientEvent('tm1_adminSystem:goto', source, user.getCoords().x, user.getCoords().y, user.getCoords().z)
				end
			end)
			return
		end

		TriggerClientEvent('esx:showNotification',source, "Has traido  ~g~correctamente~w~.")
		TriggerClientEvent('tm1_adminSystem:bringed',target,source)
	else
		
	end
end)

RegisterServerEvent('tm1_adminSystem:freeze')
AddEventHandler('tm1_adminSystem:freeze', function(permission, target)
	local source = source
	local target = target
	print("hello")
	if isItAvaliable(source,permission) == true then
		local xPlayer
		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			TriggerClientEvent('esx:showNotification',source, "Introduce un parámetro.")
			return
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end

		TriggerClientEvent('tm1_adminSystem:freezed',target)
		TriggerClientEvent('esx:showNotification',source, "Has cambiado el estado del jugador.")
	else

	end
end)

RegisterServerEvent('tm1_adminSystem:heal')
AddEventHandler('tm1_adminSystem:heal', function(permission, target)
	local source = source
	local target = target
	if isItAvaliable(source,permission) == true then
		local xPlayer
		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			TriggerClientEvent('esx:showNotification',source, "Introduce un parámetro.")
			return
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end

		TriggerClientEvent('tm1_adminSystem:healed',target)
		TriggerClientEvent('esx:showNotification',source, "Has ~g~rellenado~w~ a un jugador.")
	else

	end
end)

RegisterServerEvent('tm1_adminSystem:kill')
AddEventHandler('tm1_adminSystem:kill', function(permission, target)
	local source = source
	local target = target
	if isItAvaliable(source,permission) == true then
		local xPlayer
		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			TriggerClientEvent('esx:showNotification',source, "Introduce un parámetro.")
			return
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end

		TriggerClientEvent('tm1_adminSystem:killed',target)
		TriggerClientEvent('esx:showNotification',source, "Has ~r~matado~w~ a un jugador.")
	else

	end
end)

function getID(str)
	for i in string.gmatch(str, "%S+") do
		return i
	 end
end

function getMessage(str)
	local msg = ""
	local iterador = 1
	for i in string.gmatch(str, "%S+") do
		if iterador ~= 1 then
			msg = msg..i.." "
		end
		iterador = iterador + 1
	end
	return msg
end

RegisterServerEvent('tm1_adminSystem:kick')
AddEventHandler('tm1_adminSystem:kick', function(permission, msg)
	local source = source
	local target = getID(msg)
	local mensaje = getMessage(msg)
	if isItAvaliable(source,permission) == true then
		local xPlayer
		if target then
			xPlayer = ESX.GetPlayerFromId(target)
		else
			TriggerClientEvent('esx:showNotification',source, "Introduce un parámetro.")
			return
		end

		if not xPlayer then
			TriggerClientEvent('esx:showNotification',source, "Jugador ~r~no ~w~online.")
			return
		end
		
		DropPlayer(target,mensaje)
		TriggerClientEvent('esx:showNotification',source, "Has ~r~expulsado~w~ a un jugador.")
	else

	end
end)

RegisterServerEvent('tm1_adminSystem:eat')
AddEventHandler('tm1_adminSystem:eat', function(permission)
	local source = source
	if isItAvaliable(source,permission) == true then
		print("hola")
		TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
		TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
		TriggerClientEvent('esx:showNotification',source, "Has ~g~comido~w~.")
	else

	end
end)

RegisterServerEvent('tm1_adminSystem:announce')
AddEventHandler('tm1_adminSystem:announce', function(permission,msg)
	local source = source
	if isItAvaliable(source,permission) == true then
		TriggerClientEvent('chatMessage', source, 'ADMINISTRACIÓN | ', {255, 0, 0}, msg)
		TriggerClientEvent('esx:showNotification',source, "Has ~g~enviado~w~un mensaje.")
	else

	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/gordo" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local esadmin = user.getGroup()
			if esadmin == "superadmin" then 
				CancelEvent()
				TriggerClientEvent('inv:gordo',source)
			end
		end)
	end
end)




TriggerEvent('es:addCommand', 'mp', function(source, args, user)
	--veo si es admin
	local source = source
	local receptor = tonumber(args[2])

	if #args == 2 then
		TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Debes poner el mensaje!")
	elseif #args == 1 then
		TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Debes poner la ID del usuario!")
	else

		table.remove(args,1)
		table.remove(args,1)
		local mensaje = table.concat(args, " ")

		TriggerEvent('es:getPlayerFromId',source,function(user)
			if user.getGroup() == "mod" or user.getGroup() == "admin" or user.getGroup() == "superadmin" then -- si el que usa el comando es admin hago cosas
				if GetPlayerName(tonumber(receptor)) then

					TriggerClientEvent('chatMessage', receptor, "MP de "..GetPlayerName(tonumber(source)) .. " ID "..source, {255, 0, 0}," "..mensaje)
					TriggerClientEvent('chatMessage', source, "MP para "..GetPlayerName(tonumber(receptor)) .. " ID "..receptor, {255, 0, 0}," "..mensaje)

				else
					TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡ID Incorrecta!")
				end
			else --si no es admin veo si a quien quiere hablar es admin
				TriggerEvent('es:getPlayerFromId',receptor,function(user)
					if user.getGroup() == "mod" or user.getGroup() == "admin" or user.getGroup() == "superadmin" then -- si es admin al que quieres hablar
						if GetPlayerName(tonumber(receptor)) then
							
							TriggerClientEvent('chatMessage', receptor, "MP de "..GetPlayerName(tonumber(source)) .. " ID "..source, {255, 0, 0}," "..mensaje)
							TriggerClientEvent('chatMessage', source, "MP para "..GetPlayerName(tonumber(receptor)) .. " ID "..receptor, {255, 0, 0}," "..mensaje)

						else
								
							TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡ID Incorrecta!")

						end
					else
						TriggerClientEvent('chatMessage', source, "ERROR", {255, 0, 0}, "¡Sólo puedes enviar MPs a administradores!")
					end
				end)
			end
		end)
	end
end, {help = "Enviar MP"},{params = {{name = "userid", help = "ID para el MP"}, {name = "mensaje", help = "Mensaje"}}})