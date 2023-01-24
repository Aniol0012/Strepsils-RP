local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local HasAlreadyEnteredMarker = false
local LastZone                = nil
local actionDisplayed         = false
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsInShopMenu            = false
local Categories              = {}
local Vehicles                = {}
local LastVehicles            = {}
local CurrentVehicleData      = nil

ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.TriggerServerCallback('d3x_vehicleshop:getVehicles', function (vehicles)
		Vehicles = vehicles
	end)
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('d3x_vehicleshop:getCategories', function (categories)
		Categories = categories
	end)
	
end)

RegisterNetEvent('strepsils_cerrar_vehicleshop')
AddEventHandler('strepsils_cerrar_vehicleshop', function()
	SetNuiFocus(false, false)
    IsInShopMenu = false
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('d3x_vehicleshop:sendCategories')
AddEventHandler('d3x_vehicleshop:sendCategories', function (categories)
	Categories = categories
end)

RegisterNetEvent('d3x_vehicleshop:sendVehicles')
AddEventHandler('d3x_vehicleshop:sendVehicles', function (vehicles)
	Vehicles = vehicles
end)

function DeleteShopInsideVehicles()
	while #LastVehicles > 0 do
		local vehicle = LastVehicles[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(LastVehicles, 1)
	end
end

function StartShopRestriction()

	Citizen.CreateThread(function()
		while IsInShopMenu do
			Citizen.Wait(1)
	
			DisableControlAction(0, 75,  true) -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		end
	end)

end
RegisterCommand("pos", function(source,args,rawCommand) 
	local ped = GetPlayerPed(source)
	local coords = GetEntityCoords(ped)
	print('x = '..coords.x..', y = '..coords.y..', z = '..coords.z.. ', h = '.. GetEntityHeading(ped)) 
end, true)

RegisterNUICallback('TestDrive', function(data, cb) 
	SetNuiFocus(false, false)
	
	local model = data.model
	local playerPed = PlayerPedId()
	local playerpos = GetEntityCoords(playerPed)
	
	IsInShopMenu = false
	--exports['mythic_notify']:PersistentHudText('START','waiting','vermelho','Wait while we load your vehicle!')
	TriggerEvent("pNotify:SendNotification",{
					text = "Espera mientras se carga el <b style='color:#1EFF29'> vehículo</b>",
					type = "success",
					timeout = (3000),
					layout = Config.Alineacion,
					queue = "global"
	})
	ESX.Game.SpawnVehicle(model, vector3(-2694.49, 3255.17, 31.81), 243.9, function(vehicle)
		--exports['mythic_notify']:PersistentHudText('END','waiting')

		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		SetVehicleNumberPlateText(vehicle, "PRUEBA")
		ESX.ShowNotification("Tienes ~g~40~w~ segundos para el probar el vehículo.")
		Citizen.CreateThread(function () 
			local counter = 40
			
			while counter > 0 do 
				exports['mythic_notify']:DoCustomHudText('branco', 'La prueba finaliza en: '.. counter .. ' segundos',700)
				counter = counter -1
				Citizen.Wait(1000)
			end
			DeleteVehicle(vehicle)
			SetEntityCoords(playerPed, playerpos, false, false, false, false)

			ESX.ShowNotification("La prueba de conducción ha finalizado.")
		end)

	end)
end)

RegisterNUICallback('BuyVehicle', function(data, cb)
    SetNuiFocus(false, false)

    local model = data.model
	local playerPed = PlayerPedId()
	IsInShopMenu = false
	--exports['mythic_notify']:PersistentHudText('START','waiting','vermelho','Wait while we load your vehicle!')

    ESX.TriggerServerCallback('d3x_vehicleshop:buyVehicle', function(hasEnoughMoney)
		--exports['mythic_notify']:PersistentHudText('END','waiting')

		if hasEnoughMoney then

			ESX.Game.SpawnVehicle(model, Config.Zones.ShopOutside.Pos, Config.Zones.ShopOutside.Heading, function (vehicle)
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

				local newPlate     = GeneratePlate()
				local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
				vehicleProps.plate = newPlate
				SetVehicleNumberPlateText(vehicle, newPlate)

				if Config.EnableOwnedVehicles then
					TriggerServerEvent('d3x_vehicleshop:setVehicleOwned', vehicleProps)
				end

				ESX.ShowNotification(_U('vehicle_purchased'))
			end)

		else
			ESX.ShowNotification(_U('not_enough_money'))
		end

	end, model)
end)

RegisterNUICallback('CloseMenu', function()
    SetNuiFocus(false, false)
    IsInShopMenu = false
end)

RegisterCommand('fecharmenu', function() 
	SetNuiFocus(false, false)
    IsInShopMenu = false

end)

function OpenShopMenu()

	local vehicle = {}

	if not IsInShopMenu then
		IsInShopMenu = true
		SetNuiFocus(true, true)
		
		SendNUIMessage({
            show = true,
			cars = Vehicles,
			categories = Categories
        })
	end

end


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function (job)
	ESX.PlayerData.job = job
end)

AddEventHandler('d3x_vehicleshop:hasEnteredMarker', function (zone)
	if zone == 'ShopEntering' or zone == 'Shop2' or zone == 'Shop3'  then

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
		actionDisplayed = true

	elseif zone == 'ResellVehicle' then
		local playerPed = PlayerPedId()

		if IsPedSittingInAnyVehicle(playerPed) then

			local vehicle     = GetVehiclePedIsIn(playerPed, false)
			local vehicleData, model, resellPrice, plate

			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				for i=1, #Vehicles, 1 do
					if GetHashKey(Vehicles[i].model) == GetEntityModel(vehicle) then
						vehicleData = Vehicles[i]
						break
					end
				end
	
				resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.ResellPercentage)
				model = GetEntityModel(vehicle)
				plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
	
				CurrentAction     = 'resell_vehicle'
				CurrentActionMsg  = 'Pulsa ~g~[E]~w~ para vender por ' .. ESX.Math.GroupDigits(resellPrice)
				ESX.ShowHelpNotification('Pulsa ~g~[E]~w~ para vender por ' .. ESX.Math.GroupDigits(resellPrice)..'€' )
	
				CurrentActionData = {
					vehicle = vehicle,
					label = vehicleData.name,
					price = resellPrice,
					model = model,
					plate = plate
				}
			end

		end

	end
end)

AddEventHandler('d3x_vehicleshop:hasExitedMarker', function (zone)
	if not IsInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInShopMenu then
			ESX.UI.Menu.CloseAll()

			DeleteShopInsideVehicles()

			local playerPed = PlayerPedId()

			FreezeEntityPosition(playerPed, false)
			SetEntityVisible(playerPed, true)
			SetEntityCoords(playerPed, Config.Zones.ShopEntering.Pos.x, Config.Zones.ShopEntering.Pos.y, Config.Zones.ShopEntering.Pos.z)
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function ()
	local blip = AddBlipForCoord(Config.Zones.ShopEntering.Pos.x, Config.Zones.ShopEntering.Pos.y, Config.Zones.ShopEntering.Pos.z)

	SetBlipSprite (blip, 326)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Car Dealer")
	EndTextCommandSetBlipName(blip)
end)

function Draw3DText(x,y,z,text,scale)
	local onScreen, _x, _y = World3dToScreen2d(x,y,z)
	local pX,pY,pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(true)
	SetTextColour(255, 255, 255, 255)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len( text )) / 700
	DrawRect(_x, _y + 0.0150, 0.06 +factor, 0.03, 0, 0, 0, 200)
end

-- Display markers
Citizen.CreateThread(function ()
	
	while true do
		Citizen.Wait(0)

		local coords = GetEntityCoords(PlayerPedId())

		if(Config.Zones.ResellVehicle.Type ~= -1 and GetDistanceBetweenCoords(coords, Config.Zones.ResellVehicle.Pos.x, Config.Zones.ResellVehicle.Pos.y, Config.Zones.ResellVehicle.Pos.z, true) < Config.DrawDistance) then
			DrawMarker(Config.Zones.ResellVehicle.Type, Config.Zones.ResellVehicle.Pos.x, Config.Zones.ResellVehicle.Pos.y, Config.Zones.ResellVehicle.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.ResellVehicle.Size.x, Config.Zones.ResellVehicle.Size.y, Config.Zones.ResellVehicle.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		end
	end
end)

Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(0)
		local coords      = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			if v.Type == 36 then
				if Vdist(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z) <= 8 then
					Draw3DText(v.Pos.x, v.Pos.y, v.Pos.z, "Pusa ~g~[E]~w~ para ver el catálogo.",0.4)
				end
			end
		end
		
	end
	
end)


-- Enter / Exit marker events
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 3.5) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker  then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('d3x_vehicleshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('d3x_vehicleshop:hasExitedMarker', LastZone)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction == nil then
			Citizen.Wait(500)
		else

			-- ESX.ShowHelpNotification('Pressione ~INPUT_CONTEXT~ para ver o catálogo!')
			
			if IsControlJustReleased(0, Keys['E']) then
				if CurrentAction == 'shop_menu' then
					OpenShopMenu()
				elseif CurrentAction == 'resell_vehicle' then

					ESX.TriggerServerCallback('d3x_vehicleshop:resellVehicle', function(vehicleSold)

						if vehicleSold then
							ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
							ESX.ShowNotification(_U('vehicle_sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
						else
							ESX.ShowNotification(_U('not_yours'))
						end

					end, CurrentActionData.plate, CurrentActionData.model)
				end

				CurrentAction = nil
			end
		end
	end
end)

Citizen.CreateThread(function()
	RequestIpl('shr_int') -- Load walls and floor

	local interiorID = 7170
	LoadInterior(interiorID)
	EnableInteriorProp(interiorID, 'csr_beforeMission') -- Load large window
	RefreshInterior(interiorID)
end)
