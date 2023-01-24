local userSkills = {}

---FUNCIÓN PARA OBTENER LAS HABILIDADES DE UN USUARIO--
function getSkillsFromUser(source)
	for i,v in pairs(userSkills) do
		local skills = {}
		if v.identifier == source then
			return v.skills
		end
	end
	return nil
end

--FUNCIÓN PARA COMPROBAR SI UN USUARIO TIENE UNA HABILIDAD DETERMINADA--
function haveThisSkill(source,skill)
	local skills = getSkillsFromUser(source)
	for i,v in pairs(skills) do
		if v == skill then
			return true
		end
	end
	return false
end

--FUNCIÓN PARA BORRAR TODAS LAS SKILLS DE UN USUARIO--
function clearSkills(source)
	for i,v in pairs(userSkills) do
		if v.identifier == source then
			userSkills[i] = {}
			return true
		end
	end
	return false
end

--REFRESCAR BASE DE DATOS--
function refreshDB(source)
	local skills = getSkillsFromUser(source)
	local id = GetPlayerIdentifiers(source)[1]
	local skillsInJson = json.encode(skills)
	MySQL.Async.execute("UPDATE users SET skills = @skills WHERE identifier = @identifier",{['@identifier'] = id,['@skills'] = skillsInJson}, function(cb) end)
	return true
end

--FUNCIÓN PARA AÑADIR UNA HABILIDAD A UN USUARIO--
function addSkill(source,skill)
	for i,v in pairs(userSkills) do
		if v.identifier == source then
			table.insert(v.skills,skill)
			refreshDB(source)
			TriggerClientEvent('pop_university:setInfo',source,v.skills)
			return true
		end
	end
	return false
end

--FUNCIÓN LA CUAL CREA LA HABILIDAD PREDERTEMINADA POR SI EL USUARIO NUNCA HA ENTRADO AL SERVIDOR--
function createPrincipalSkills(identifier)
	local skills = {"live"}
	local skillsInJson = json.encode(skills)
	MySQL.Async.execute("UPDATE users SET skills = @skills WHERE identifier = @identifier",{['@identifier'] = identifier,['@skills'] = skillsInJson}, function(cb) end)
end

--PASAMOS LAS HABILIDADES AL CLIENTE--
function putInToSkillsArray(source,skills)
	table.insert(userSkills, {identifier = source,skills = skills})
	TriggerClientEvent('pop_university:setInfo',source,skills)
end

--COMPROBACIÓN INICIAL--
function getSkillsInfo(source)
	local id = GetPlayerIdentifiers(source)[1]
	local data = MySQL.Sync.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier", {
		['@identifier'] = id
	})
	if not data[1] or data[1].skills == nil or data[1].skills == "" then
		createPrincipalSkills(id)
		putInToSkillsArray(source,{"live"})
	else
		putInToSkillsArray(source,json.decode(data[1].skills))
	end
end

--SETEAR LAS HABILIDADES EN EL STRING PRINCIPAL CUANDO SE CONECTA UN USUARIO--
RegisterServerEvent('pop_university:getInfo')
AddEventHandler('pop_university:getInfo',function()
	local source = source
	getSkillsInfo(source)
end)

--BORRAR LAS HABILIDADES PARA OPTIMIZAR LA MEMORIA CUANDO SE DESCONECTA UN USUARIO--
AddEventHandler('playerDropped', function(reason)
    clearSkills(source)
end)

RegisterServerEvent('pop_university:buySkill')
AddEventHandler('pop_university:buySkill',function(data)
	local source = source
	TriggerEvent('es:getPlayerFromId',source, function(userEssential)
		TriggerEvent('exp:getPlayerFromId',source, function(userExp)
			if not(haveThisSkill(source,data[2])) then
				if userExp.getPoints() >= data[1] then
					if userEssential.getMoney() >= data[5] then
						if data[3] == nil then
							if data[4] == nil then
								--SI NO SE NECESITA NI NIVEL, NI HABILIDAD
								userExp.removePoints(data[1])
								userEssential.removeMoney(data[5])
								addSkill(source,data[2])
								TriggerClientEvent('exp:Notificate',source,"Has comprado la habilidad")
							else
								--SI NO SE NECESITA NI NIVEL, PERO SI HABILIDAD
								if haveThisSkill(source,data[4]) then
									userExp.removePoints(data[1])
									userEssential.removeMoney(data[5])
									addSkill(source,data[2])
									TriggerClientEvent('exp:Notificate',source,"Has comprado la habilidad")
								else
									TriggerClientEvent('exp:NotificateError',source,"Necesitas la habilidad anterior")
								end
							end
						else
							if data[4] == nil then
								--SI SE NECESITA NIVEL, PERO NO HABILIDAD
								if userExp.getLevel() >= data[3] then
									userExp.removePoints(data[1])
									userEssential.removeMoney(data[5])
									addSkill(source,data[2])
									TriggerClientEvent('exp:Notificate',source,"Has comprado la habilidad")
								else
									TriggerClientEvent('exp:NotificateError',source,"No tienes el nivel requerido")
								end
							else
								--SI SE NECESITA NIVEL Y HABILIDAD
								if userExp.getLevel() >= data[3] then
									if haveThisSkill(source,data[4]) then
										userExp.removePoints(data[1])
										userEssential.removeMoney(data[5])
										addSkill(source,data[2])
										TriggerClientEvent('exp:Notificate',source,"Has comprado la habilidad")
									else
									TriggerClientEvent('exp:NotificateError',source,"Necesitas la habilidad anterior")
									end
								else
									TriggerClientEvent('exp:NotificateError',source,"No tienes el nivel requerido")
								end
							end
						end
					else
						TriggerClientEvent('exp:NotificateError',source,"No tienes el dinero suficiente para comprar la habilidad")
					end
				else
					TriggerClientEvent('exp:NotificateError',source,"No tienes tantos puntos de experiencia")
				end
			else
				TriggerClientEvent('exp:NotificateError',source,"Ya tienes esa habilidad aprendida")
			end
		end)
	end)
end)

--[[ 
AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/meditar" then
		local source = source
		if haveThisSkill(source,"meditacion") then
			TriggerClientEvent('pop_university:medite',source)
		else
			TriggerClientEvent('exp:NotificateError',source,"No tienes ni idea de eso hermano.")
		end
	end
end)
]]