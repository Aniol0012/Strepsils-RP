--Almacena la experiencia de todos los usuarios
usersEXP = {}
------------------------
--------LENGUAJE--------
------------------------
SLOCALES = {
	experience = "puntos de experiencia.",
	level = "nivel",
	points = "puntos",
	getExperience = "Has conseguido ",
	getLevel = "Has alcanzado el nivel "
}

------------------------
--PARÁMETROS DE AJUSTE--
------------------------
MULTIPLIER = false --Indica si el sistema va a ir por multiplicador o por sumatoria

BASE = 500
INCREMENT = 1.05
ADD = 100
---------------------
--FUNCIONES VITALES--
---------------------
function loadExp(source,identifier,date)
	if date == nil then
		usersEXP[source] = CreateExp(source,identifier,0,0,0)
		refreshNUI(source,0,0,0)
	else
		usersEXP[source] = CreateExp(source,identifier,date.lvl,date.exp,date.sp)
		refreshNUI(source,date.lvl,date.exp,date.sp)
	end
	print("Experiencia cargada al jugador : "..GetPlayerName(source))
end

function calculatePercent(experience,level)
	local percent = 0
	if MULTIPLIER == true then
		if level < 1 then
			return ( experience * 100 ) / BASE 
		else
			local necesary = BASE
			for i = 1, level do
				necesary = necesary * INCREMENT
			end
			return ( experience * 100 ) / necesary 
		end
	else
		local necesary = BASE + (ADD * level)
		return ( experience * 100 ) / necesary 
	end
end

function refreshNUI( source,level,experience,points )
	TriggerClientEvent('exp:refreshNUI',source,level,points,calculatePercent(experience,level))
end

function recalculateAll(source,level,experience)
	local beforeLevel = level
	local level = level
	local experience = experience
	while true do
		if MULTIPLIER == true then
			if level < 1 then
				if experience >= BASE then
					experience = experience - BASE
					level = level + 1
				else
					break
				end
			else
				local necesary = BASE
				for i = 1, level do
					necesary = necesary * INCREMENT
				end
				if experience >= necesary then
					experience = experience - necesary
					level = level + 1
				else
					break
				end
			end
		else
			local necesary = BASE + (ADD * level)
			if experience >= necesary then
				experience = experience - necesary
				level = level + 1
			else
				break
			end
		end
	end
	local diference = level - beforeLevel
	print("EXP : "..experience.." LVL : "..level.." SOURCE : "..source)
	usersEXP[source].setLevelRestrictedToLocal(level)
	if diference == 0 then
		TriggerClientEvent('exp:playSound',source,'notification')
	else
		usersEXP[source].addPoints(diference)
		TriggerClientEvent('exp:playSound',source,'levelup')
	end
	usersEXP[source].setExperience(experience)
end

function setEXPToNone(source)
	usersEXP[source].setExperience(0)
end

function registerExp(source,identifier)
	MySQL.Async.execute("INSERT INTO tm1_exp (`identifier`) VALUES (@identifier)", {identifier = identifier})
	loadExp(source,identifier)
end

function existExp(source)
	local ids = GetPlayerIdentifiers(source)
	local identifier = ids[1]
	local data = MySQL.Sync.fetchAll("SELECT * FROM tm1_exp WHERE identifier = @id", {[' @id'] = identifier})
	if data[1] ~= nil then
		print("Cargando experiencia al jugador : "..GetPlayerName(source))
		loadExp(source,identifier,data[1])
	else
		print("Creando experiencia al jugador : "..GetPlayerName(source))
		registerExp(source,identifier)
	end
end

----------------------------------
--CARGAR EXPERIENCIA DEL JUGADOR--
----------------------------------
RegisterServerEvent('exp:initEXP')
AddEventHandler('exp:initEXP',function()
	existExp(source)
end)

-- Si quieres retirar el comando (/off) solo ponlo en comentario y listo.

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/off" then
		local source = source
		TriggerClientEvent('exp:putOffInterface',source)
		usersEXP[source].refreshNUI()
	end
end)

AddEventHandler("exp:getPlayerFromId", function(user, cb)
	if(usersEXP)then
		if(usersEXP[user])then
			cb(usersEXP[user])
		else
			cb(nil)
		end
	else
		cb(nil)
	end
end)

RegisterServerEvent('exp:addExperience')
AddEventHandler('exp:addExperience',function(exp,sourcea)
	local source = source
	if sourcea == nil then
		usersEXP[source].addExperience(exp)
	else
		usersEXP[sourcea].addExperience(exp)
	end
end)