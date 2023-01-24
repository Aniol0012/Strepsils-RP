ESX = nil
local esmicoche = nil
local oferta = nil
local modelosbanned = {'VOLTIC2'}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function notificacion(texto)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(texto)
    DrawNotification(false, true)
end

AddEventHandler('playerSpawned',function()
end)

RegisterNetEvent('cas_vendercoche:compruebocoche') --El que lo vende
AddEventHandler('cas_vendercoche:compruebocoche',function(id,precio)
	
	local coords1 = GetEntityCoords(GetPlayerPed(PlayerId()))

	local coords2 = GetEntityCoords(GetPlayerPed(GetPlayerServerId(id)))

	--	if GetDistanceBetweenCoords(coords1,coords2) < 1.5 then
			if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 	
				local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				local matr =  GetVehicleNumberPlateText(vehicle)
				local isbanned = false
				for i = 1, #modelosbanned,1 do
					Citizen.Trace(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
					Citizen.Trace(modelosbanned[i])
					if GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) == modelosbanned[i] then 
						isbanned = true
						break
					end
				end
				if isbanned == true then
					TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Este coche no puede ser vendido.")
					isbanned = false
				else

					TriggerServerEvent('cas_vendercoche:esmicoche',matr,id,precio,vehicle,GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))	
				end
			else
				TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Debes de estar encima del vehículo que quieres vender.")
			end
	--	else
	--		notificacion("Too far from the player")
	--	end
end)

RegisterNetEvent('cas_vendercoche:esmicochecallback')
AddEventHandler('cas_vendercoche:esmicochecallback',function(var,id,precio,matr,car,name)
	if var == true then
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Esperando la respuesta del comprador...")
		TriggerServerEvent('cas_vendercoche:vendococheser',id,precio,matr,car,name)
	else
		TriggerEvent('chatMessage',"Vendedor", {255, 0, 0}, "Este coche no es tuyo, ladrón!")
	end
end)

RegisterNetEvent('cas_vendercoche:vendocoche') --El que recibe la oferta
AddEventHandler('cas_vendercoche:vendocoche',function(price,jugador,matr,vehicle,name)

	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"ID("..jugador..") quiere venderte su ^2 "..name.."^0 por ^2 "..price.." $")
	TriggerEvent('chatMessage',"Vendedor", {255, 0, 0},"^2 ENTER ^0 para ACEPTAR o ^2 X ^0 para rechazar la oferta.")
	oferta = true
	Citizen.CreateThread(function()
		while oferta do
				if IsControlJustPressed(1, 18) then -- 1 = YES
					TriggerServerEvent('cas_vendercoche:handleroferta',true,jugador,matr,price,name)
					oferta = false
				end
				if IsControlJustPressed(1, 73) then -- 2 = NO
					TriggerServerEvent('cas_vendercoche:handleroferta',false,jugador,matr,price,name)
					oferta = false
				end
			Citizen.Wait(0)
		end
	end)
end)


