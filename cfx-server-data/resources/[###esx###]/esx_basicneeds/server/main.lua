ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'muhittin', text = 'Ekmek Yedin',  length = 3000})
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'yemek', text = 'Stresiniz Azaldı',  length = 5000})
	local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
	ESX.ShowAdvancedNotification('Cerebro', '~o~Donut', 'En el menú ~g~F6 s~puedes encender el taxímetro \n~o~L~s~: Reiniciar el servicio. \n~o~K~s~: Contador', mugshotStr, 1)
	UnregisterPedheadshot(mugshot)
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	--TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'muhittin', text = 'Su İçtiniz.',  length = 3000})
end)


ESX.RegisterUsableItem('pastel', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pastel', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'muhittin', text = 'Enerji İcecegi İçtiniz.',  length = 3000})
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'yemek', text = 'Stresiniz Azaldı',  length = 5000})
end)

ESX.RegisterUsableItem('vip_coin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vip_coin', 1)
	xPlayer.addAccountMoney('bank', 100000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 400000)
	--TriggerClientEvent('esx_basicneeds:onEat', source)
	msg = "Has usado una moneda de donador. Se han añadido 100.000 € a tu cuenta bancaria."
    TriggerEvent("pNotify:SendNotification", {text = msg , type = "success", layout = "centerLeft", queue = "global", theme = "gta", timeout = 8000})
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'muhittin', text = 'Enerji İcecegi İçtiniz.',  length = 3000})
	--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'yemek', text = 'Stresiniz Azaldı',  length = 5000})
end)

--[[
ESX.RegisterUsableItem('mdt', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	--xPlayer.removeInventoryItem('mdt', 1)
	if xPlayer.job.name == 'police' then
    	MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(reports)
    		for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
    		end
    		MySQL.Async.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
    			end


    			local officer = GetCharacterName(usource)
    			TriggerClientEvent('mdt:toggleVisibilty', usource, reports, warrants, officer)
    		end)
    	end)
	else
		msg = "No eres policía"
		TriggerEvent("pNotify:SendNotification", {text = msg , type = "error", layout = "centerLeft", queue = "global", theme = "gta", timeout = 8000})
    end
end)
]]


TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				--print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'Te han curado.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'Jugador no conectado.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', 'ID inválida.' } })
		end
	else
		--print(('esx_basicneeds: %s yenilendi'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2STREPSILS RP', '¡Permisos Insuficientes!' } })
end, {help = 'Restaurar la vida', params = {{name = 'playerId', help = 'La ID del jugador.'}}})