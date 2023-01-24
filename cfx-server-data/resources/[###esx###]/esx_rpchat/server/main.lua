--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
--
--			  ███████	████████████	████████	███████		████████	███████		████████████	██				███████			  ██████████	████████
--			  ██			 ██			██	  ██	██			██	  ██	██			     ██    		██				██ 				  ██	  ██	██	  ██
--			  ██			 ██			██	  ██	██			██    ██	██			     ██			██				██				  ██	  ██	██	  ██
--			  ███████	 	 ██			████████	███████		████████	███████	         ██ 		██				███████			  ██████████	████████
--				   ██		 ██			██  ██		██			██				 ██	         ██			██					 ██			  ██  ██		██
--				   ██ 		 ██			██  ██		██			██				 ██	         ██ 		██ 				     ██   		  ██  ██		██
--			  ███████		 ██			██	████	███████		██			███████		████████████	███████████		███████			  ██  ██████	██
--																																																				          By Aniol0012
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

-- Dependencias

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

--[[ Esto es para que si no pones ningun comando se escriba un mensaje. Pero si esta puesto el rolesFX, esto hay que quitarlo.

 AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = getIdentity(source)
		TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
      end
      CancelEvent()
  end)
  
--]]
  
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

-- Proximidad

--[[
  TriggerEvent('es:addCommand', 'me', function(source, args, user)
    local name = getIdentity(source)
    table.remove(args, 2)
    TriggerClientEvent('esx-qalle-chat:me', -1, source, name.firstname, table.concat(args, " "))
end)

--]]


------------------------------------------------------------------- Comandos de roleo por Aniol0012 --------------------------------------------------------------------------------------------------------------------------------------------------

-- Tweeter

 RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733579.svg"> @{0}: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /twt es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)


TriggerEvent('es:addCommand', 'twt', function()
end, { help = ('Enviar un tweet') })


 RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733579.svg"> @{0}: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /tweet es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)



TriggerEvent('es:addCommand', 'tweet', function()
end, { help = ('Enviar un tweet') })

-- Instagram

 RegisterCommand('insta', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(222, 76, 138,1) 3%, rgba(222, 76, 138,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/2111/2111463.svg"> @{0}: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /insta es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'insta', function()
end, { help = ('Enviar un instagram') })

 RegisterCommand('instagram', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(10)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(222, 76, 138,1) 3%, rgba(222, 76, 138,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/2111/2111463.svg"> @{0}: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /instagram es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'instagram', function()
end, { help = ('Enviar un instagram') })

-- Lgtbi

RegisterCommand('lgtbi', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(255, 0, 0, 1),rgba(255, 166, 0, 0.800),rgba(255, 255, 0, 0.300),rgba(0, 128, 0, 0.300),rgba(0, 0, 255, 0.300),rgba(76, 0, 130, 0.200),rgba(238, 130, 238, 0)); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/3011/3011428.svg"> #LGTBI [@{0}]: {1}</div>', -- Negro
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2 El /lgtbi es de", " (^7" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'lgtbi', function()
end, { help = ('Enviar un lgtbi') })

-- Anónimos

 RegisterCommand('anontweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(10)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733635.svg"> @Anónimo: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /anontweet es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'anontweet', function()
end, { help = ('Enviar un tweet anónimo') })

 RegisterCommand('atweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(7)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733635.svg"> @Anónimo: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /atweet es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'atweet', function()
end, { help = ('Enviar un tweet anónimo') })

 RegisterCommand('atwt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(7)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733635.svg"> @Anónimo: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /atwt es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'atweet', function()
end, { help = ('Enviar un tweet anónimo') })

-- Administración


RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(3)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(255, 0, 0,1) 3%, rgba(255, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/1077/1077170.svg"> Anuncio Administrativo: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El Administrador es", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, true)

TriggerEvent('es:addCommand', 'ad', function()
end, { help = ('Enviar un mensaje administrativo') })


--[[
TriggerEvent('es:addGroupCommand', 'anuncio', "admin", function(source, args, user)
	TriggerClientEvent('chat:addMessage', -1, {
		args = {"^1ANNOUNCEMENT", table.concat(args, " ")}
	})
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Announce a message to the entire server", params = {{name = "announcement", help = "The message to announce"}}})
--]]

-- Entorno

RegisterCommand('entorno', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(8)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(255, 160, 242, 1) 3%, rgba(255, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://www.flaticon.com/premium-icon/icons/svg/2801/2801751.svg"> Entorno: {1}</div>',
        args = { fal, msg }
    })
	
	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chat:addMessage', k, {
						args = {"^2El /entorno es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
					})
				end
			end)
		end
	end)
end, false)

TriggerEvent('es:addCommand', 'entorno', function()
end, { help = ('Enviar un mensaje de entorno') })


----- Trabajos: 

 RegisterCommand('policia', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(8)
    local name = getIdentity(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'police' then 
    	fal = name.firstname .. " " .. name.lastname
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(36, 211, 242,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 17px" src="https://image.flaticon.com/icons/svg/733/733579.svg"> @{0}: {1}</div>',
			args = { fal, msg }
		})
		
		TriggerEvent("es:getPlayers", function(pl)
			for k,v in pairs(pl) do
				TriggerEvent("es:getPlayerFromId", k, function(user)
					if(user.getPermissions() > 0 and k ~= source)then
						TriggerClientEvent('chat:addMessage', k, {
							args = {"^2El /policia es de", " (^8" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
						})
					end
				end)
			end
		end)
    end
end, false)

TriggerEvent('es:addCommand', 'policia', function()
end, { help = ('Enviar un mensaje como policia') })


-- PM
--[[
TriggerEvent('es:addCommand', 'pm', function(source, args, user)
if (GetPlayerName(tonumber(args[2])) or GetPlayerName(tonumber(args[3]))) then
local player = tonumber(args[2])
table.remove(args, 2)
table.remove(args, 1)

TriggerEvent("es:getPlayerFromId", player, function(target)
TriggerClientEvent('chatMessage', player, "MD:", {214, 214, 214}, "^2"..GetPlayerName(source).. " | " .. player .. " | PM: ^7" ..table.concat(args, " "))
TriggerClientEvent('chatMessage', source, "MD:", {214, 214, 214}, "^3 Enviado a: "..GetPlayerName(player).. ": ^7" ..table.concat(args, " "))
end)
else
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "ID Incorrecta!")
end
end, function(source, args, user)
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "Permisos insuficientes")
end)

-- DM

TriggerEvent('es:addCommand', 'dm', function(source, args, user)
if (GetPlayerName(tonumber(args[2])) or GetPlayerName(tonumber(args[3]))) then
local player = tonumber(args[2])
table.remove(args, 2)
table.remove(args, 1)

TriggerEvent("es:getPlayerFromId", player, function(target)
TriggerClientEvent('chatMessage', player, "MD:", {214, 214, 214}, "^2"..GetPlayerName(source).. " | " .. player .. " | PM: ^7" ..table.concat(args, " "))
TriggerClientEvent('chatMessage', source, "MD:", {214, 214, 214}, "^3 Enviado a: "..GetPlayerName(player).. ": ^7" ..table.concat(args, " "))
end)
else
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "ID Incorrecta!")
end
end, function(source, args, user)
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "Permisos insuficientes")
end)

-- MD

TriggerEvent('es:addCommand', 'md', function(source, args, user)
if (GetPlayerName(tonumber(args[2])) or GetPlayerName(tonumber(args[3]))) then
local player = tonumber(args[2])
table.remove(args, 2)
table.remove(args, 1)

TriggerEvent("es:getPlayerFromId", player, function(target)
TriggerClientEvent('chatMessage', player, "MD:", {214, 214, 214}, "^2"..GetPlayerName(source).. " | " .. player .. " | PM: ^7" ..table.concat(args, " "))
TriggerClientEvent('chatMessage', source, "MD:", {214, 214, 214}, "^3 Enviado a: "..GetPlayerName(player).. ": ^7" ..table.concat(args, " "))
end)
else
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "ID Incorrecta!")
end
end, function(source, args, user)
TriggerClientEvent('chatMessage', source, "^2STREPSILS RP", {255, 0, 0}, "Permisos insuficientes")
end)
]]