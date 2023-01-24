
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




TriggerEvent('es:addGroupCommand', 'reviveall', 'admin', function(source, args, user)

	TriggerClientEvent('reviveallplayer', source)

end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "^2SISTEMA", {255, 0, 0}, "¡Permisos Insuficientes!")
end, {help = 'Revivir todos los jugadores'})


TriggerEvent('es:addGroupCommand', 'healall', 'admin', function(source, args, user)

	TriggerClientEvent('healallplayer', source)

end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "^2SISTEMA", {255, 0, 0}, "¡Permisos Insuficientes!")
end, {help = 'Curar todos los jugadores'})
------- Revive Player  


-------- Event สำหรับชุบ -------------------

RegisterServerEvent('reviveallxenon:revive')
AddEventHandler('reviveallxenon:revive', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)


		TriggerClientEvent('xenon:revive', target)

end)

-----------------------------------------

