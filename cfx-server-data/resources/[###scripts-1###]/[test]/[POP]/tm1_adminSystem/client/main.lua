---------------------------------------------------
--SISTEMA ADMINISTRATIVO HECHO POR THEMAYKELLLL1--
--     TODOS LOS DERECHOS DE USO RESERVADOS     --
---------------------------------------------------

---------------
-- VARIABLES --
---------------
PERMISSION_LEVEL = 0
isMenuOpened = false
noclip = false
godmode = false
vanish = false
spectate = false
freeze = false
noclip_speed = 2.01

ranks = {}

---------
-- ESX --
---------
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	ESX.UI.Menu.CloseAll()
end)

--------------
-- LLAMADAS --
--------------
AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('tm1_adminSystem:getPermissionLevel')
end)
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	TriggerServerEvent('tm1_adminSystem:getPermissionLevel')
end)


-------------
-- EVENTOS --
-------------
RegisterNetEvent('tm1_adminSystem:setPermissionLevel')
AddEventHandler('tm1_adminSystem:setPermissionLevel',function(permission,rank)
	PERMISSION_LEVEL = permission
	ranks = rank
	Citizen.Trace("hola")
end)

RegisterNetEvent('tm1_adminSystem:nocliped')
AddEventHandler('tm1_adminSystem:nocliped',function()
	noclip = not noclip
    local ped = GetPlayerPed(-1)
    if noclip then
    	SetEntityInvincible(ped, true)
    	SetEntityVisible(ped, false, false)
    else
    	SetEntityInvincible(ped, false)
    	SetEntityVisible(ped, true, false)
    end
    if noclip == true then 
    	TriggerEvent('esx:showNotification', "~w~Has ~g~activado ~w~el noclip.")
    else
    	TriggerEvent('esx:showNotification', "~w~Has ~r~desactivado ~w~el noclip.")
    end
    openAdministrativeMenu()
end)

RegisterNetEvent('tm1_adminSystem:godmoded')
AddEventHandler('tm1_adminSystem:godmoded',function()
	godmode = not godmode
    local ped = GetPlayerPed(-1)
    SetEntityInvincible(ped, godmode)
    if godmode == true then 
    	TriggerEvent('esx:showNotification', "~w~Has ~g~activado ~w~el godmode.")
    else
    	TriggerEvent('esx:showNotification', "~w~Has ~r~desactivado ~w~el godmode.")
    end
    openAdministrativeMenu()
end)

RegisterNetEvent('tm1_adminSystem:returnSpectate')
AddEventHandler('tm1_adminSystem:returnSpectate',function()
	spectate = false
end)

RegisterNetEvent('tm1_adminSystem:vanished')
AddEventHandler('tm1_adminSystem:vanished',function()
	vanish = not vanish
    local ped = GetPlayerPed(-1)
    SetEntityVisible(ped, not vanish, false)
    if vanish == true then 
    	TriggerEvent('esx:showNotification', "~w~Has ~g~activado ~w~el vanish.")
    else
    	TriggerEvent('esx:showNotification', "~w~Has ~r~desactivado ~w~el vanish.")
    end
    openAdministrativeMenu()
end)

RegisterNetEvent('tm1_adminSystem:bringed')
AddEventHandler('tm1_adminSystem:bringed',function(t)
	SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(t)))) 
end)

RegisterNetEvent('tm1_adminSystem:goto')
AddEventHandler('tm1_adminSystem:goto',function(x,y,z)
	SetEntityCoords(PlayerPedId(), x, y, z) 
end)

RegisterNetEvent('tm1_adminSystem:freezed')
AddEventHandler('tm1_adminSystem:freezed',function()
	freeze = not freeze
	local ped = GetPlayerPed(-1)
	local player = PlayerId()
	if not freeze then
		if not IsEntityVisible(ped) then
			SetEntityVisible(ped, true)
		end

		if not IsPedInAnyVehicle(ped) then
			SetEntityCollision(ped, true)
		end

		FreezeEntityPosition(ped, false)
		--SetCharNeverTargetted(ped, false)
		SetPlayerInvincible(player, false)
		TriggerEvent('esx:showNotification', "Te ha ~g~descongelado~w~ un administrador.")
	else
		SetEntityCollision(ped, false)
		FreezeEntityPosition(ped, true)
		--SetCharNeverTargetted(ped, true)
		SetPlayerInvincible(player, true)
		--RemovePtfxFromPed(ped)

		if not IsPedFatallyInjured(ped) then
			ClearPedTasksImmediately(ped)
		end
		TriggerEvent('esx:showNotification', "Te ha ~r~congelado~w~ un administrador.")
	end
end)

RegisterNetEvent('tm1_adminSystem:healed')
AddEventHandler('tm1_adminSystem:healed',function()
	local Ped = GetPlayerPed(-1)
	SetEntityHealth(Ped, 200)
	ClearPedBloodDamage(Ped)
	ResetPedVisibleDamage(Ped)
	ClearPedLastWeaponDamage(Ped)
end)

RegisterNetEvent('tm1_adminSystem:killed')
AddEventHandler('tm1_adminSystem:killed',function()
	local Ped = GetPlayerPed(-1)
	SetEntityHealth(Ped, 0)
end)
-----------
-- HILOS --
-----------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 163) then
			if PERMISSION_LEVEL > 0 then 
				if isMenuOpened == false then
					openAdministrativeMenu()
					isMenuOpened = true
				elseif isMenuOpened == true then
					ESX.UI.Menu.CloseAll()
					isMenuOpened = false
				end
			else
				errorMessage('Aquí no hay nada mindundi')
			end
		end
		if noclip then
	      local ped = GetPlayerPed(-1)
	      local x,y,z = getPosition()
	      local dx,dy,dz = getCamDirection()
	      local speed = noclip_speed

	      -- Resetear velocidad
	      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

	      if IsControlPressed(0,32) then
	        x = x+speed*dx
	        y = y+speed*dy
	        z = z+speed*dz
	      end

	      if IsControlPressed(0,269) then
	        x = x-speed*dx
	        y = y-speed*dy
	        z = z-speed*dz
	      end

	      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
	    end
	end
end)

---------------
-- FUNCIONES --
---------------

function isItAvaliable(permission)
	for i,v in pairs(ranks[PERMISSION_LEVEL]) do
		if v == permission then
			return true
		end
	end
	return false
end

function openGetterMenu(type)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'getterAdminMenu',
	{
		title = "Ingrese el parámetro correspondiente",
	}, function(data, menu)
		local parameter = data.value
		if type == "spawnCar" then
			TriggerEvent('esx:spawnVehicle', parameter)
			TriggerEvent('esx:showNotification', "Se ha intentado spawnear un : ~g~"..parameter.."~w~.")
		elseif type == "spawnPed" then
			TriggerEvent('esx:spawnPed', parameter)
			TriggerEvent('esx:showNotification', "Se ha intentado spawnear un : ~g~"..parameter.."~w~.")
		elseif type == "spawnObject" then
			TriggerEvent('esx:spawnObject', parameter)
			TriggerEvent('esx:showNotification', "Se ha intentado spawnear un : ~g~"..parameter.."~w~.")
		elseif type == "setJob" then
			local args = split(parameter, " ")
			TriggerServerEvent('tm1_adminSystem:setJob','setJob',args)
		elseif type == "clearInventory" then
			TriggerServerEvent('tm1_adminSystem:clearInventory','clearInventory',parameter)
		elseif type == "bring" then
			TriggerServerEvent('tm1_adminSystem:bring','bring',parameter)
		elseif type == "goto" then
			TriggerServerEvent('tm1_adminSystem:bring','goto',parameter, -1)
		elseif type == "freeze" then
			TriggerServerEvent('tm1_adminSystem:freeze','freeze',parameter)
		elseif type == "heal" then
			TriggerServerEvent('tm1_adminSystem:heal','heal',parameter)
		elseif type == "kill" then
			TriggerServerEvent('tm1_adminSystem:kill','kill',parameter)	
		elseif type == "kick" then
			TriggerServerEvent('tm1_adminSystem:kick','kick',parameter)	
		elseif type == "announce" then
			TriggerServerEvent('tm1_adminSystem:announce','announce',parameter)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('tm1_adminSystem:activeSpectate')
AddEventHandler('tm1_adminSystem:activeSpectate',function()
spectate = true
ESX.UI.Menu.CloseAll()
end)
function openAdministrativeMenu()

	local elements = {}

	if PERMISSION_LEVEL == 0 then
		table.insert(elements, {label ="No tienes suficientes permisos para ver esto", value = "noPermissions"})
	else
		local actions = {
			{label = "Noclip", value = "noclip"},
			{label = "GodMode", value = "godmode"},
			{label = "Vanish", value = "vanish"},
			{label = "Spectear", value = "spectate"},
			{label = "Teletransporte a punto", value = "tpoint"},
			{label = "Saltico pa'lante", value = "jump"},
			{label = "Spawnear coche", value = "spawnCar"},
			{label = "Borrar vehículo", value = "clearVehicle"},
			{label = "Spawnear ped", value = "spawnPed"},
			{label = "Spawnear objeto", value = "spawnObject"},
			{label = "Borrar el chat", value = "clearChat"},
			{label = "Setear el job", value = "setJob"},
			{label = "Borrar inventario", value = "clearInventory"},
			{label = "Traer a jugador", value = "bring"},
			{label = "Ir a jugador", value = "goto"},
			{label = "Freezear", value = "freeze"},
			{label = "Rellenar vida", value = "heal"},
			{label = "Matar jugador", value = "kill"},
			{label = "Kickear a usuario", value = "kick"},
			{label = "Comer y beber", value = "eat"},
			{label = "Anunciar mensaje", value = "announce"},
			{label = "Reparar coche", value = "fix"}
		}

		for i,v in pairs(actions) do
			if isItAvaliable(v.value) then
				if v.value == "noclip" and noclip == true then
					table.insert(elements, {label = v.label.." <span style='color: green;'>Activado</span>'" , value = v.value})
				elseif v.value == "noclip" and noclip == false then
					table.insert(elements, {label = v.label.." <span style='color: red;'>Desactivado</span>" , value = v.value})
				elseif v.value == "godmode" and godmode == true then
					table.insert(elements, {label = v.label.." <span style='color: green;'>Activado</span>'" , value = v.value})
				elseif v.value == "godmode" and godmode == false then
					table.insert(elements, {label = v.label.." <span style='color: red;'>Desactivado</span>" , value = v.value})
				elseif v.value == "vanish" and vanish == true then
					table.insert(elements, {label = v.label.." <span style='color: green;'>Activado</span>'" , value = v.value})
				elseif v.value == "vanish" and vanish == false then
					table.insert(elements, {label = v.label.." <span style='color: red;'>Desactivado</span>" , value = v.value})
				elseif v.value == "spectate" and spectate == true then
					table.insert(elements, {label = v.label.." <span style='color: green;'>Activado</span>'" , value = v.value})
				elseif v.value == "spectate" and spectate == false then
					table.insert(elements, {label = v.label.." <span style='color: red;'>Desactivado</span>" , value = v.value})
				else
					table.insert(elements, {label = v.label , value = v.value})
				end
			end
		end
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'adminMenu',
		{
			title  = "Menu administrativo",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "noclip" then
				TriggerServerEvent('tm1_adminSystem:noclip','noclip')
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "godmode" then
				TriggerServerEvent('tm1_adminSystem:godmode','godmode')
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "vanish" then
				TriggerServerEvent('tm1_adminSystem:vanish','vanish')
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "noPermissions" then
				isMenuOpened = false
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "tpoint" then
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
						teleportByCar()
					else
						teleportToPoint()
					end
				else
					TriggerEvent('esx:showNotification', "Tienes que seleccionar un punto en el mapa.")
				end
			elseif data.current.value == "jump" then
				jump()
			elseif data.current.value == "openCar" then
				openCar()
			elseif data.current.value == "spectate" then
				spectate = not spectate
				if spectate == true then
					TriggerServerEvent('es_camera:spectate')
				else
					TriggerServerEvent('es_camera:spectate',-1)
				end
				ESX.UI.Menu.CloseAll()
			elseif data.current.value == "spawnCar" then
				openGetterMenu('spawnCar')
			elseif data.current.value == "clearVehicle" then
				TriggerEvent('esx:deleteVehicle')
				TriggerEvent('esx:showNotification', "Vehículo ~r~eliminado~w~.")
			elseif data.current.value == "spawnPed" then
				openGetterMenu('spawnPed')
			elseif data.current.value == "spawnObject" then
				openGetterMenu('spawnObject')
			elseif data.current.value == "clearChat" then
				TriggerServerEvent('tm1_adminSystem:clearChat','clearChat')
			elseif data.current.value == "setJob" then
				openGetterMenu('setJob')
			elseif data.current.value == "clearInventory" then
				openGetterMenu('clearInventory')
			elseif data.current.value == "bring" then
				openGetterMenu('bring')
			elseif data.current.value == "goto" then
				openGetterMenu('goto')
			elseif data.current.value == "freeze" then
				openGetterMenu('freeze')
			elseif data.current.value == "heal" then
				openGetterMenu('heal')
			elseif data.current.value == "kill" then
				openGetterMenu('kill')
			elseif data.current.value == "kick" then
				openGetterMenu('kick')
			elseif data.current.value == "eat" then
				Citizen.Trace("hnetrhnrt")
				TriggerServerEvent('tm1_adminSystem:eat','eat')
			elseif data.current.value == "announce" then
				openGetterMenu('announce')
			elseif data.current.value == "fix" then
				TriggerEvent( 'wk:fixVehicle')
			end
			isMenuOpened = false
		end,
		function(data, menu)
			isMenuOpened = false
			menu.close()
		end
	)
end

function teleportByCar()
	local player = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	local coche =  GetVehiclePedIsIn(GetPlayerPed(-1),false)
		local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
		SetEntityCoords(coche,coord.x,coord.y,coord.z+5)
		TriggerEvent('esx:showNotification', "Te has teletransportado ~g~correctamente.")
		SetPedIntoVehicle(GetPlayerPed(-1), coche, - 1)
		DrawNotification(false, true)
end

function teleportToPoint()
    local player = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
	SetEntityCoords(player,coord.x,coord.y,coord.z)
	TriggerEvent('esx:showNotification', "Te has teletransportado ~g~correctamente.")
	DrawNotification(false, true)
end

function jump()
	if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
		local coche =  GetVehiclePedIsIn(GetPlayerPed(-1),false)
		local coord = GetEntityCoords(GetPlayerPed(-1))
		SetEntityCoords(GetPlayerPed(-1),coord.x + 10,coord.y,coord.z)
		SetEntityCoords(coche,coord.x+5,coord.y,coord.z)
		SetPedIntoVehicle(GetPlayerPed(-1), coche, - 1)
	else
		TriggerEvent('esx:showNotification', "~r~No ~w~estás montado en un coche.")
	end
end

function openCar()
	local vehicle, distance = ESX.Game.GetClosestVehicle()
	if distance ~= -1 and distance <= 1.0 then
		SetVehicleDoorsLocked(vehicle, 1)
		SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), false)
		TriggerEvent('esx:showNotification', "Has ~g~abierto ~w~el coche.")
	end
end

function errorMessage(text)
    TriggerEvent("pNotify:SendNotification", {
		text = "<span style='font-weight: 800'><center>" .. text .. "</center></span>",
	    layout = "centerRight",
	    timeout = 2000,
	    progressBar = false,
	    type = "error",
	    animation = {
	        open = "gta_effects_fade_in",
	        close = "gta_effects_fade_out"
    }})
end

function getPosition()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  	return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function split(inputstr, sep)
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

RegisterNetEvent('inv:gordo')
AddEventHandler('inv:gordo',function()
	local model = GetHashKey("a_m_m_fatlatin_01")
        RequestModel(model)
        while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(0)
        end

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
end)