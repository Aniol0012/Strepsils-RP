------------------------
--CLASE DE EXPERIENCIA--
------------------------

function CreateExp(source,identifier,level,experience,points)
	local self = {}

	--CREANDO ATRIBUTOS
	self.source = source
	self.identifier = identifier
	self.level = level
	self.experience = experience
	self.points = points

	--CREANDO MÉTODOS
	local rMethods = {}

	rMethods.addLevel = function (n)
		if type(n) == "number" then
			local newLevel = self.level + n
			self.level = newLevel
			refreshNUI( self.source,self.level,self.experience,self.points )
			MySQL.Async.execute("UPDATE tm1_exp SET lvl = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.level})
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	
	rMethods.removeLevel = function (n)
		if type(n) == "number" then
			local newLevel = self.level - n

			if newLevel >= 0 then
				self.level = newLevel
				setEXPToNone(self.source)
				refreshNUI( self.source,self.level,self.experience,self.points )
				MySQL.Async.execute("UPDATE tm1_exp SET lvl = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.level})
			else
				log("ERROR 002: No se puede poner el nivel por debajo de 0")
				print("ERROR 002: No se puede poner el nivel por debajo de 0")
			end	
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end
	

	rMethods.setLevel = function (n)
		if type(n) == "number" then
			local newLevel = n
			if newLevel < 0 then
				log("ERROR 001: Operación prohibida")
				print("ERROR 001: Operación prohibida")
			else
				if not(self.level == newLevel) then
					TriggerClientEvent('exp:Notificate',self.source,SLOCALES.getLevel.."<span style='color : #66ff66;'>"..n.."</span> "..".")
				end	
				self.level = newLevel
				setEXPToNone(self.source)
				refreshNUI( self.source,self.level,self.experience,self.points )
				MySQL.Async.execute("UPDATE tm1_exp SET lvl = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.level})		
			end	
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.refreshNUI = function (n)
		refreshNUI( self.source,self.level,self.experience,self.points )
	end

	rMethods.setLevelRestrictedToLocal = function (n)
		if type(n) == "number" then
			local newLevel = n
			if newLevel < 0 then
				log("ERROR 001: Operación prohibida")
				print("ERROR 001: Operación prohibida")
			else
				if not(self.level == newLevel) then
					TriggerClientEvent('exp:Notificate',self.source,SLOCALES.getLevel.."<span style='color : #66ff66;'>"..n.."</span> "..".")
				end
				self.level = newLevel
				MySQL.Async.execute("UPDATE tm1_exp SET lvl = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.level})		
			end	
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.getLevel = function ()
		return self.level
	end

	rMethods.addExperience = function (n)
		if type(n) == "number" then
			if n > 0 then
				TriggerClientEvent('exp:Notificate',self.source,SLOCALES.getExperience.."<span style='color : #66ff66;'>"..n.."</span> "..SLOCALES.experience)
				local newExperience = self.experience + n
				recalculateAll(self.source,self.level,newExperience)
			else 
				log("ERROR 001: Operación prohibida")
				print("ERROR 001: Operación prohibida")
			end
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.removeExperience = function (n)
		if type(n) == "number" then
			local newExperience = self.experience - n

			if newExperience >= 0 then
				self.experience = newExperience
			else
				self.experience = 0
			end	
			MySQL.Async.execute("UPDATE tm1_exp SET exp = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.experience})
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.setExperience = function (n)
		if type(n) == "number" then
			local newExperience = n

			if n < 0 then
				log("ERROR 001: Operación prohibida, setearemos la experiencia a 0 por seguridad")
				print("ERROR 001: Operación prohibida, setearemos la experiencia a 0 por seguridad")
				self.experience = 0
			else
				self.experience = newExperience
				refreshNUI( self.source,self.level,self.experience,self.points )
			end	

			MySQL.Async.execute("UPDATE tm1_exp SET exp = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.experience})
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.getExperience = function ()
		return self.experience
	end

	rMethods.addPoints = function (n)
		if type(n) == "number" then
			local newPoints = self.points + n

			self.points = newPoints
			MySQL.Async.execute("UPDATE tm1_exp SET sp = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.points})
			refreshNUI( self.source,self.level,self.experience,self.points )
			TriggerClientEvent('exp:Notificate',self.source,SLOCALES.getExperience.."<span style='color : #66ff66;'>"..n.."</span> "..SLOCALES.points)
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.removePoints = function (n)
		if type(n) == "number" then
			local newPoints = self.points - n

			if newPoints >= 0 then
				self.points = newPoints
				MySQL.Async.execute("UPDATE tm1_exp SET sp = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.points})
				refreshNUI( self.source,self.level,self.experience,self.points )	
			else
				log("ERROR 004: No se puede poner los puntos de experiencia por debajo de 0")
				print("ERROR 004: No se puede poner los puntos de experiencia por debajo de 0")
			end	
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.setPoints = function (n)
		if type(n) == "number" then
			local newPoints = n

			self.points = newPoints
			MySQL.Async.execute("UPDATE tm1_exp SET sp = @cantidad WHERE identifier = @identifier",{['@identifier'] = self.identifier,['@cantidad'] = self.points})
			refreshNUI( self.source,self.level,self.experience,self.points )
			for a = 1, n do
				TriggerClientEvent('exp:Notificate',self.source,SLOCALES.getExperience.."<span style='color : #66ff66;'>"..n.."</span> "..SLOCALES.points)
			end
		else
			log("ERROR 001: El tipo de dato recibido no era el que se esperaba")
			print("ERROR 001: El tipo de dato recibido no era el que se esperaba")
		end
	end

	rMethods.getPoints = function ()
		return self.points
	end

	rMethods.getIdentifier = function ()
		return self.identifier
	end

	rMethods.getSource = function ()
		return self.source
	end

	return rMethods
end