--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
--
--			  ███████	████████████	████████	███████		████████	███████		████████████	██				███████			  ██████████	████████
--			  ██			 ██			██	  ██	██			██	  ██	██			     ██    		██				██ 				  ██	  ██	██	  ██
--			  ██			 ██			██	  ██	██			██    ██	██			     ██			██				██				  ██	  ██	██	  ██
--			  ███████	 	 ██			████████	███████		████████	███████	         ██ 		██				███████			  ██████████	████████
--				   ██		 ██			██  ██		██			██				 ██	         ██			██					 ██			  ██  ██		██
--				   ██ 		 ██			██  ██		██			██				 ██	         ██ 		██ 				     ██   		  ██  ██		██
--			  ███████		 ██			██	████	███████		██			███████		████████████	███████████		███████			  ██  ██████	██
--																																								By Aniol0012
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Locales
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local HasAlreadyEnteredMarker, OnJob, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, IsDead, CurrentActionData = false, false, false, false, false, false, {}
local CurrentCustomer, CurrentCustomerBlip, DestinationBlip, targetCoords, LastZone, CurrentAction, CurrentActionMsg

ESX = nil

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- ESX Default
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Eventos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Funciones secundarias
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName(msg)
		EndTextCommandBusyString(type)
		Citizen.Wait(time)

		RemoveLoadingPrompt()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Guardarropa
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenCloakroom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_cloakroom',
	{
		title    = '<span style="color:lawngreen;">Guardarropa - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = {
			{ label = '<span style="color:khaki;">Ropa de civil<span style="color:white;">', value = 'wear_citizen' },
			{ label = '<span style="color:lightgreen;">Ropa de trabajo<span style="color:white;">',    value = 'wear_work'},
			{ label = '<span style="color:pink;">Chaleco<span style="color:white;">',    value = 'chaleco'},
		}
	}, function(data, menu)
		if data.current.value == 'wear_citizen' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'wear_work' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'chaleco' then
			AbrirChalecosMenu()		
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Chalecos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function AbrirChalecosMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_cloakroom_chalecos',
	{
		title    = '<span style="color:pink;">Chalecos - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = {
			{ label = '<span style="color:lightcyan;">Chaleco Negro<span style="color:white;">',    value = 'chaleco1'},
			{ label = '<span style="color:green;">Chaleco Verde<span style="color:white;">',    value = 'chaleco2'},
			{ label = '<span style="color:chocolate;">Chaleco de camuflaje [Marrón]<span style="color:white;">',    value = 'chaleco3'},
			{ label = '<span style="color:darkolivegreen;">Chaleco de camuflaje [Verde]<span style="color:white;">',    value = 'chaleco4'}
		}
	}, function(data, menu)
		local ped = GetPlayerPed(-1)
		if data.current.value == 'chaleco1' then
			Citizen.Wait(100)
			ClearPedTasks(ped)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			loadAnimDict( "amb@world_human_cop_idles@male@base" )
			TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
			Citizen.Wait(700)
			SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 1, 2)
			ClearPedTasks(ped)
			SetPedArmour(PlayerPedId(), 100)
			
		elseif data.current.value == 'chaleco2' then
			Citizen.Wait(100)
			ClearPedTasks(ped)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			loadAnimDict( "amb@world_human_cop_idles@male@base" )
			TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
			Citizen.Wait(700)
			SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 2, 2)
			ClearPedTasks(ped)
			SetPedArmour(PlayerPedId(), 100)
			
		elseif data.current.value == 'chaleco3' then
			Citizen.Wait(100)
			ClearPedTasks(ped)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			loadAnimDict( "amb@world_human_cop_idles@male@base" )
			TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
			Citizen.Wait(700)
			SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 3, 2)
			ClearPedTasks(ped)
			SetPedArmour(PlayerPedId(), 100)
			
		elseif data.current.value == 'chaleco4' then
			Citizen.Wait(100)
			ClearPedTasks(ped)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			loadAnimDict( "amb@world_human_cop_idles@male@base" )
			TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
			Citizen.Wait(700)
			SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 4, 2)
			ClearPedTasks(ped)
			SetPedArmour(PlayerPedId(), 100)
			
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'cloakroom_chalecos'
		CurrentActionData = {}
	end)
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Vehiculos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()

	local elements = {}

	if Config.EnableSocietyOwnedVehicles then

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

			for i=1, #vehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
					value = vehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('spawn_veh'),
				align    = Config.Alineacion,
				elements = elements
			}, function(data, menu)
				if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
					--ESX.ShowNotification(_U('spawnpoint_blocked'))
					ESX.ShowAdvancedNotification('admin', '~r~¡Hay un vehiculo bloqueando el spawn!', '', Config.FotoMsg, 1)
					return
				end

				menu.close()

				local vehicleProps = data.current.value
				ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
					ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
					local playerPed = PlayerPedId()
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)

				TriggerServerEvent('esx_society:removeVehicleFromGarage', 'admin', vehicleProps)

			end, function(data, menu)
				CurrentAction     = 'vehicle_spawner'
				CurrentActionMsg  = _U('spawner_prompt')
				CurrentActionData = {}

				menu.close()
			end)
		end, 'admin')

	else -- not society vehicles
		--[[
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = '<span style="color:bisque;">Puertas<span style="color:white;">', value = 'puertas',})
		end]]
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= '<span style="color:orange;">🚗 Sacar vehículo <span style="color:white;">',
			align		= Config.Alineacion,
			elements	= Config.AuthorizedVehicles
		}, function(data, menu)
			if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				--ESX.ShowNotification(_U('spawnpoint_blocked'))
				ESX.ShowAdvancedNotification('Administración', '~r~¡Hay un vehiculo bloqueando el spawn!', '', Config.FotoMsg, 1)
				return
			end

			menu.close()
			ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				Citizen.Wait(100) -- Me esperao a que spawnee el coche
				local veh = GetVehiclePedIsIn(playerPed, false)
				SetVehicleNumberPlateText(veh, "STAFF")
			end)
		end, function(data, menu)
			CurrentAction     = 'vehicle_spawner'
			CurrentActionMsg  = _U('spawner_prompt')
			CurrentActionData = {}

			menu.close()
		end)
	end
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Eliminar vehiculos
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function DeleteJobVehicle()
	local playerPed = PlayerPedId()

	if Config.EnableSocietyOwnedVehicles then
		local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
		TriggerServerEvent('esx_society:putVehicleInGarage', 'admin', vehicleProps)
		ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
	else
		if IsInAuthorizedVehicle() then
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

			if Config.MaxInService ~= -1 then
				TriggerServerEvent('esx_service:disableService', 'admin')
			end
		else
			--ESX.ShowNotification(_U('only_admin'))
			ESX.ShowAdvancedNotification('Administración', '~r~¡Solo puedes guardar admins!', '', Config.FotoMsg, 1)
		end
	end
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menú de admin (fijo)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenadminActionsMenu()
	local elements = {
		{label = _U('deposit_stock'), value = 'put_stock'},
		{label = _U('take_stock'), value = 'get_stock'}
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'experimente' then
		--table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_actions', {
		title    = 'Almacén para admins',
		align    = Config.Alineacion,
		elements = elements
	}, function(data, menu)

		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'admin', function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'admin_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menú de admin (móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenMobileadminActionsMenu()
	ESX.UI.Menu.CloseAll()
	
	local elements = {
		--{label = '<span style="color:orange;">📜 Factura<span style="color:white;">',   value = 'billing'},
	}
	
	if Config.AbrirGeneral then
		table.insert(elements, {label = '<span style="color:green;">💂‍ General<span style="color:white;">', value = 'ageneral',})
	end
	
	if Config.AbrirVehMenu then
		table.insert(elements, {label = '<span style="color:red;">🚗 Vehciulos<span style="color:white;">', value = 'avehiculos',})
	end
	
	if Config.AbrirObjetos then
		table.insert(elements, {label = '<span style="color:orange;">📦 Objetos<span style="color:white;">', value = 'aobjetos',})
	end
	
	if Config.GPS then
		table.insert(elements, {label = '<span style="color:darkorchid;">🏤 Marcar en el GPS el INEM<span style="color:white;">', value = 'gpsadmin',})
	end
	
	-- Admin no disponible
	-- Entrar/salir
	-- Spectate
	
	if Config.Salir then
		table.insert(elements, {label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'salir',})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_admin_actions', {
		title    = '<span style="color:lawngreen;">Administración - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = elements
			
	}, function(data, menu)

		if data.current.value == 'avehiculos' then
				AbrirInfoVehiculosMenu()
				
		elseif data.current.value == 'ageneral' then
				AbrirGeneralAdminMenu()
				
		elseif data.current.value == 'aobjetos' then
				AbrirGeneralObjetosMenu()
		
		elseif data.current.value == 'gpsadmin' then
				SetNewWaypoint(-137.7, 6310.67, 31.74)

				PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 3)

				ESX.ShowAdvancedNotification('Administración', '~g~Has marcado el INEM', '', Config.FotoMsg, 1)

				Citizen.Wait(1)
		
		elseif data.current.value == 'salir' then
			ESX.UI.Menu.CloseAll()
		end
	end, function(data, menu)
		menu.close()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Admin general (menu móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function AbrirGeneralAdminMenu()
	local elements  = {}
	
	if Config.Factura then
		table.insert(elements, {label = '<span style="color:orange;">📜 Factura<span style="color:white;">', value = 'billing',})
	end	
	
	if Config.Delgun then
		table.insert(elements, {label = '<span style="color:cyan;">🔫 Activar / desactivar armas eliminadoras<span style="color:white;">', value = 'delgun',})
	end
	
	if Config.Reportes then
		table.insert(elements, {label = '<span style="color:red;">🚨 Iniciar un reporte<span style="color:white;">', value = 'reporte',})
	end	
	
	if Config.Reportes then
		table.insert(elements, {label = '<span style="color:green;">✅ Finalizar el reporte<span style="color:white;">', value = 'reporte2',})
	end
	
	if Config.Salir then
		table.insert(elements, {label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'salir',})
	end

	--ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'adminmenugeneral', {
		title    = '<span style="color:lawngreen;">General - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = elements		
	}, function(data, menu)
	
		local playerPed = PlayerPedId()
		local coords  = GetEntityCoords(playerPed)
		vehicle = ESX.Game.GetVehicleInDirection()
		
		if data.current.value == 'billing' then 
		
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
				title = _U('invoice_amount')
			}, function(data, menu)

				local amount = tonumber(data.value)
				if amount == nil then
					ESX.ShowAdvancedNotification('Administración', '~r~Cantidad invalida', '', Config.FotoMsg, 1)
				else
					menu.close()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 5.0 then
						ESX.ShowAdvancedNotification('Administración', '', '~r~No ~s~hay jugadores cerca \n~o~[5 metros]', Config.FotoMsg, 1)
						
					else
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'bank_savings', 'admin', amount) -- Con esto puedes decir donde quieres que se cobren las facturas (Default admin: society_admin)
						ESX.ShowAdvancedNotification('Administración', '~g~Has enviado una factura', '', Config.FotoMsg, 1)
					end

				end

			end, function(data, menu)
				menu.close()
			end)
		
		elseif data.current.value == 'reporte' then
			TriggerEvent('strepsils_adminareaset')
		
		elseif data.current.value == 'reporte2' then
			TriggerEvent('strepsils_adminareaclear')

		elseif data.current.value == 'delgun' then
			TriggerEvent('strepsils_delgun')	
			
		elseif data.current.value == 'salir' then
			ESX.UI.Menu.CloseAll()
		end
	end, function(data, menu)
		menu.close()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Objetos (menu móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function AbrirGeneralObjetosMenu()

	--[[
	if Config.Salir then
		table.insert(elements, {label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'salir',})
	end
	]]

	--ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'objetosmenugeneral', {
		title    = '<span style="color:orange;">Objetos - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = {
			{label = '<span style="color:red;">Cono', model = 'prop_roadcone02a'},
			{label = '<span style="color:cyan;">Barrera', model = 'prop_barrier_work05'},
			{label = '<span style="color:lightgray;">Pinchos', model = 'p_ld_stinger_s'},
			{label = '<span style="color:orange;">Caja', model = 'prop_boxpile_07d'},
			
	}}, function(data, menu)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		local forward   = GetEntityForwardVector(playerPed)
		local x, y, z   = table.unpack(coords + forward * 1.0)

		if data.current.model == 'prop_roadcone02a' then
			z = z - 2.0
			
		end
				
		ESX.Game.SpawnObject(data.current.model, {x = x, y = y, z = z}, function(obj)
			SetEntityHeading(obj, GetEntityHeading(playerPed))
			PlaceObjectOnGroundProperly(obj)
		end)
	end, function(data, menu)
		menu.close()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Vehciulos (menu móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function AbrirInfoVehiculosMenu()
	local elements  = {}
	
	if Config.InfoVeh then
		table.insert(elements, {label = '<span style="color:plum;">📄 Información del vehículo<span style="color:white;">', value = 'infoveh',})
	end	
	
	if Config.DesbloquearVehiculo then
		table.insert(elements, {label = '<span style="color:cyan;">🔑 Desbloquear vehículo<span style="color:white;">', value = 'desveh',})
	end
	
	if Config.Gasolina then
		table.insert(elements, {label = '<span style="color:orange;">⛽ Poner gasolina<span style="color:white;">', value = 'gasolina',})
	end
	
	if Config.Limpiar then
		table.insert(elements, {label = '<span style="color:lightpink;">🚿 Limpiar el vehículo<span style="color:white;">', value = 'limpiarveh',})
	end
		
	if Config.Tracker then
		table.insert(elements, {label = '<span style="color:lightgreen;">💻 Encender el trackeador policial<span style="color:white;">', value = 'tracker',})
	end
	
	if Config.EliminarVehiculo then
		table.insert(elements, {label = '<span style="color:red;">🚗 Eliminar vehículo<span style="color:white;">', value = 'eliminarveh',})
	end
	
	if Config.DvAll and ESX.PlayerData.job ~= nil and (ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'novice') then
		table.insert(elements, {label = '<span style="color:orangered;">🚚 Eliminar todos los vehiculos<span style="color:white;">', value = 'dvall',})
	end
	
	if Config.Salir then
		table.insert(elements, {label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'salir',})
	end

	--ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehiculomenugeneral', {
		title    = '<span style="color:red;">Vehiculos - Menú<span style="color:white;">',
		align    = Config.Alineacion,
		elements = elements		
	}, function(data, menu)
	
		local playerPed = PlayerPedId()
		local coords  = GetEntityCoords(playerPed)
		vehicle = ESX.Game.GetVehicleInDirection()
		
		if data.current.value == 'eliminarveh' then 
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				--[[local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
				ESX.ShowAdvancedNotification('Vehículo', 'Has ~r~eliminado ~s~el vehículo.', '', mugshotStr, 1)
				UnregisterPedheadshot(mugshot)]]
				ESX.ShowAdvancedNotification('Administración', 'Has ~g~eliminado ~s~el vehículo.', '', Config.FotoMsg, 1)
			else
				--[[local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
				ESX.ShowAdvancedNotification('Vehículo', '', '~r~No hay ningún vehículo cerca para eliminar.', mugshotStr, 1)
				UnregisterPedheadshot(mugshot)]]
				ESX.ShowAdvancedNotification('Administración', '', '~r~No hay ningún vehículo cerca para eliminar.', Config.FotoMsg, 1)
			end		
		elseif data.current.value == 'desveh' then
			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowAdvancedNotification('Administración', '', '~r~No puedes desbloquear el vehículo desde dentro.', Config.FotoMsg, 1)
			else
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
					TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
					Citizen.Wait(20000)
					ClearPedTasksImmediately(playerPed)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				
					ESX.ShowAdvancedNotification('Administración', '~g~Has desbloqueado el vehículo.', '', Config.FotoMsg, 1)
				else
					ESX.ShowAdvancedNotification('Administración', '', '~r~No hay ningún vehículo cerca para desbloquear', Config.FotoMsg, 1)
				end
			end
			
		elseif data.current.value == 'limpiarveh' then
			if IsPedSittingInAnyVehicle(playerPed) then -- IsPedSittingInAnyVehicle(PlayerPedId())
				local car = GetVehiclePedIsUsing(PlayerPedId())
				WashDecalsFromVehicle(car, 1.0)
				SetVehicleDirtLevel(car)
				ESX.ShowAdvancedNotification('Administración', '~g~Has limpiado el vehículo.', '', Config.FotoMsg, 1)
			else
				ESX.ShowAdvancedNotification('Administración', '', '~r~Debes estar dentro de un vehículo para limpiarlo.', Config.FotoMsg, 1)
			end
			
		elseif data.current.value == 'infoveh' then
			if DoesEntityExist(vehicle) then
				local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
				OpenVehicleInfosMenu(vehicleData)
			else
				ESX.ShowAdvancedNotification('Administración', '', '~r~No se detecta ningún vehículo cerca.', Config.FotoMsg, 1)
			end
		
		elseif data.current.value == 'dvall' then
			if Config.Seguro then
				AbrirMenuSeguro()
			else
				TriggerEvent("wld:delallveh", -1)
				ESX.UI.Menu.CloseAll()
				ESX.ShowAdvancedNotification('Administración', '~g~Has eliminado todos los vehiculos.', '', Config.FotoMsg, 1)
			end
		
		elseif data.current.value == 'gasolina' then
			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(PlayerPedId())
				SetFuel(vehicle, 100)
				ESX.ShowAdvancedNotification('Administración', '~g~Has rellenado el tanque de gasolina.', '', Config.FotoMsg, 1)
			else
				ESX.ShowAdvancedNotification('Administración', '~r~Debes estar dentro de un vehículo.', '', Config.FotoMsg, 1)
			end
			
		elseif data.current.value == 'tracker' then
			TriggerEvent('strepsils_abrir_tracker')
			
		elseif data.current.value == 'salir' then
			ESX.UI.Menu.CloseAll()
		end
	end, function(data, menu)
		menu.close()
	end)
end

local vehicle = GetVehiclePedIsIn(PlayerPedId())

function SetFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
		DecorSetFloat(vehicle, Config.FuelDecor, GetVehicleFuelLevel(vehicle))
	end
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Menu Seguro (menu móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function AbrirMenuSeguro()
	local elements  = {}
	
	if Config.Seguro then
		table.insert(elements, {label = '<span style="color:green;">Si<span style="color:white;">', value = 'si',})
	end	
		
	if Config.Salir then
		table.insert(elements, {label = '<span style="color:yellow;">🔚 Salir<span style="color:white;">', value = 'salir',})
	end

	--ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehiculomenuseguro', {
		title    = '<span style="color:lawngreen;">¿Estás seguro?<span style="color:white;">',
		align    = Config.Alineacion,
		elements = elements		
	}, function(data, menu)
	
		local playerPed = PlayerPedId()
		local coords  = GetEntityCoords(playerPed)
		vehicle = ESX.Game.GetVehicleInDirection()
		
		if data.current.value == 'si' then
			TriggerEvent("wld:delallveh", -1)
			ESX.UI.Menu.CloseAll()
			ESX.ShowAdvancedNotification('Administración', '~g~Has eliminado todos los vehiculos.', '', Config.FotoMsg, 1)
			
		elseif data.current.value == 'salir' then
			ESX.UI.Menu.CloseAll()
		end
	end, function(data, menu)
		menu.close()
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Información de vehciulos (menu móvil)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('strepsils_admin:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = '<span style="color:plum;">Información del vehículo<span style="color:white;">',
			align    = Config.Alineacion,
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Vehiculos autorizados
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function IsInAuthorizedVehicle()
	local playerPed = PlayerPedId()
	local vehModel  = GetEntityModel(GetVehiclePedIsIn(playerPed, false))

	for i=1, #Config.AuthorizedVehicles, 1 do
		if vehModel == GetHashKey(Config.AuthorizedVehicles[i].model) then
			return true
		end
	end
	
	return false
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Stock
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_adminjob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = 'Retirar del almacén',
			align    = Config.Alineacion,
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					--ESX.ShowNotification(_U('quantity_invalid'))
					ESX.ShowAdvancedNotification('Administración', '~r~Cantidad inválida', '', Config.FotoMsg, 1)
				else
					menu2.close()
					menu.close()

					-- todo: refresh on callback
					TriggerServerEvent('esx_adminjob:getStockItem', itemName, count)
					Citizen.Wait(1000)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_adminjob:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard', -- not used
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = Config.Alineacion,
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowAdvancedNotification('Administración', '~r~Cantidad invalida', '', Config.FotoMsg, 1)
				else
					menu2.close()
					menu.close()

					TriggerServerEvent('esx_adminjob:putStockItems', itemName, count)
					Citizen.Wait(1000)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Marcadores
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

AddEventHandler('esx_adminjob:hasEnteredMarker', function(zone)
	if zone == 'VehicleSpawner' then
		CurrentAction     = 'vehicle_spawner'
		CurrentActionMsg  = _U('spawner_prompt')
		CurrentActionData = {}
	elseif zone == 'VehicleDeleter' then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('store_veh')
			CurrentActionData = { vehicle = vehicle }
		end
	elseif zone == 'adminActions' then
		CurrentAction     = 'admin_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}

	elseif zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_adminjob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Blip del trabajo
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

--[[
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.adminActions.Pos.x, Config.Zones.adminActions.Pos.y, Config.Zones.adminActions.Pos.z)

	SetBlipSprite (blip, 198)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, 5)
	SetBlipAsShortRange(blip, true)
	
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('blip_admin'))
	EndTextCommandSetBlipName(blip)
end)
]]

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Strepsils reportes
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

-- Mejoras pendientes: Hacer que el texto solo se displayee para los que esten en la zona, los que no lo esten, que no lo haga.

-- GetDistanceBetweenCoords(coords, objCoords, true)

--------------------------- Configuración ---------------------------

--misTxtDis = "~r~En esta zona hay un admin atendiendo un reporte. Si no estás involucrado, alejate."

misTxtDis = "~r~Has iniciado un reporte y se ha marcado un punto de reporte activo en el mapa."

blipRadius = 12.0 -- Sincronizado con el esx_voice

blipCol = 1 -- Default: 2 (Green)

blipName = "Reporte Activo"

--------------------------- Código ---------------------------
local blip = nil
local radiusBlip = nil
local EnReporte = false

function missionTextDisplay(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end

RegisterNetEvent('strepsils_adminareaset')
AddEventHandler("strepsils_adminareaset", function()
    RemoveBlip(blip)
    RemoveBlip(radiusBlip)

    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    radiusBlip = AddBlipForRadius(coords.x, coords.y, coords.z, blipRadius)
    SetBlipSprite(blip, 487)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, blipCol)
    SetBlipScale(blip, 0.6)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipName)
    EndTextCommandSetBlipName(blip)

    
    SetBlipAlpha(radiusBlip, 80)
    SetBlipColour(radiusBlip, blipCol)
	
    --missionTextDisplay(misTxtDis, 8000)
	
	ESX.ShowAdvancedNotification('Administración', '', '~p~Has iniciado un reporte y se ha marcado un punto de reporte activo en el mapa.', Config.FotoMsg, 1)
	
	EnReporte = true
end)

RegisterNetEvent('strepsils_adminareaclear')
AddEventHandler("strepsils_adminareaclear", function()
    RemoveBlip(blip) -- Estos dos los dejo a fuera a pesar de que haya o no reporte activo para si hay un blip que se quiera eliminar a pesar de no se como este activado pues que se quite.
    RemoveBlip(radiusBlip)
    --missionTextDisplay("~g~Has finalizado el reporte.", 5000)
	
	if EnReporte then
		ESX.ShowAdvancedNotification('Administración', '~g~Has finalizado el reporte.', '', Config.FotoMsg, 1)
	else
		ESX.ShowAdvancedNotification('Administración', '~r~No hay ningún reporte activo.', '', Config.FotoMsg, 1)
	end
	
	EnReporte = false
end)

Citizen.CreateThread(function() -- Esto elimina el blip despues de un cierto tiempo
	while true do
		Citizen.Wait(300000) -- 5 minutos

		if EnReporte then
			RemoveBlip(blip)
			RemoveBlip(radiusBlip)
			--missionTextDisplay("~o~El reporte se ha finalizado por estar demasiado tiempo activo [5 min].", 5000)
			ESX.ShowAdvancedNotification('Administración', '', '~o~El reporte se ha finalizado por estar demasiado tiempo activo [5 min].', Config.FotoMsg, 1)
			EnReporte = false
		end
		
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Entrar / salir en el macador i draw markers
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'admin' then
			local coords = GetEntityCoords(PlayerPedId())
			local isInMarker, letSleep, currentZone = false, true

			for k,v in pairs(Config.Zones) do
				local distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)

				if v.Type ~= -1 and distance < Config.DrawDistance then
					letSleep = false
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, v.Rotate, nil, nil, false)
				end

				if distance < v.Size.x then
					isInMarker, currentZone = true, k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				TriggerEvent('esx_adminjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_adminjob:hasExitedMarker', LastZone)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Arma eliminadora
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

--[[ Meter esto en el server.cfg
# Del gun
setr dog.onAim "false" # Cambiar a falso si quieres que para eliminar el objecto tengas que disparar en vez de solo apuntar.

setr dog.useAce "false" # Cambiar a true para usar los Ace permisions. Como que esta metido en el menu de admin no hace falta.
add_ace group.admin dog.delgun allow # Si se está usando el ace perms, con este comand determinas que los admins pueden usar el comando.

]]

-- ¡¡¡No tocar a menos que quieras joderlo!!!

local dogtoggle = false
local allowed = false
local passAce = false
local onAim = GetConvar("dog.onAim", "true")
local useAce = GetConvar("dog.useAce", "false")


Citizen.CreateThread(function()
    if useAce == "true" then
        TriggerServerEvent("dog:checkRole")
    end
end)

RegisterNetEvent("dog:returnCheck")
AddEventHandler("dog:returnCheck", function(check)
    passAce = check
end)

local function checkRole()
    if useAce == "false" then
        allowed = true
        return allowed
    end
    if passAce == true then
        allowed = true
        return allowed
    end
end

local function getEntity(player) -- Funcion para detectar el objet al que se esta aimeando.
	local _, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

local function aimCheck(player) -- function to check config value onAim. If it's off, then
    if onAim == "true" then
        return true
    else
        return IsPedShooting(player)
    end
end

local function drawNotification(text) -- draws a notification box
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

--[[
RegisterCommand("delgun", function()
        checkRole()
        if allowed == true then
            if dogtoggle == false then
                dogtoggle = true
                drawNotification("~g~Pistola para eliminar activada")
            else
                dogtoggle = false
                drawNotification("~p~Pistola para eliminar desactivada")
            end
        else
            drawNotification("~r~No tienes los permisos suficientes para activar la pistola para eliminar.")
        end
end, false)

]]

RegisterNetEvent('strepsils_delgun')
AddEventHandler("strepsils_delgun", function()
		checkRole()
        if allowed == true then
            if dogtoggle == false then
                dogtoggle = true
                --drawNotification("~g~Pistola para eliminar activada")
				ESX.ShowAdvancedNotification('Administración', '', '~g~Pistola para eliminar activada', Config.FotoMsg, 1)
            else
                dogtoggle = false
                --drawNotification("~p~Pistola para eliminar desactivada")
				ESX.ShowAdvancedNotification('Administración', '', '~r~Pistola para eliminar desactivada', Config.FotoMsg, 1)
            end
        else
            --drawNotification("~r~No tienes los permisos suficientes para activar la pistola para eliminar.")
			ESX.ShowAdvancedNotification('Administración', '', '~r~No tienes los permisos suficientes para activar la pistola para eliminar.', Config.FotoMsg, 1)
        end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if dogtoggle then
            if IsPlayerFreeAiming(PlayerId()) then
                local entity = getEntity(PlayerId())
                if GetEntityType(entity) == 2 or 3 then
                    if aimCheck(GetPlayerPed(-1)) then
                        SetEntityAsMissionEntity(entity, true, true)
                        DeleteEntity(entity)
                    end
                end
            end
        end
    end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Afk camara (no se pone la camara de afk)
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function() 
  while true do
    if not AfkCamara then
		N_0xf4f2c0d4ee209e20() -- InvalidateIdleCam()
		Wait(5000)
	end
  end 
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Afk
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local dontkick = { -- Poner los steams q no sean kickeados
    "steam:110000117a1e4c9 ", -- Aniol
    "steam:1100001172b03f4", -- Viktor
}
local whitelisted = nil -- y no es falso de forma predeterminada para detectar si el retardo de espera del script no funciona

-- Avisar si el tiempo se ha consumido 3 / 4 partes del total
kickWarning = true

-- Código --

local function checkIfWhitelisted(steamid)
  for _, v in ipairs(dontkick) do -- bucle a través de la matriz dontkick
    if v == steamid then -- si encuentra
      print("You are now whitelisted")
      return true -- una devolución evitará que se repita más ya que ya tienes lo que querías
    end
  end -- si el bucle termina = no coincide
  print("Not whitelisted")
  return false
end

RegisterNetEvent('afk:returnSteamID')
AddEventHandler('afk:returnSteamID', function(steamid) -- return steamid client side
  whitelisted = checkIfWhitelisted(steamid)
end)

-- Límite de tiempo para estar afk
secondsUntilKick = 480 -- 14 Minutos (480 segundos)

-- Avisar si el tiempo se ha consumido 3 / 4 partes del total
kickWarning = true

CreateThread(function()
  TriggerServerEvent("afk:getSteamID")
  if whitelisted == nil then
    Wait(1000) -- importante ya que los eventos son asincrónicos, por debajo de 1000 ms, el script puede continuar incluso antes de obtener el steamid
  end
  if not whitelisted then -- lo mismo que 'if whitelist == false then'
    while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed and Config.AFK then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "^2STREPSILS RP", {0, 255, 0}, "^1¡Serás kickeado en " .. time .. " segundos por estar AFK!")
					end

					time = time - 1
				else
					TriggerServerEvent("strepsils_kickporestarafk")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
    end
  end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Controles
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction and not IsDead then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'admin' then
				if CurrentAction == 'admin_actions_menu' then
					OpenadminActionsMenu()
				elseif CurrentAction == 'cloakroom' then
					OpenCloakroom()
				elseif CurrentAction == 'vehicle_spawner' then
					OpenVehicleSpawnerMenu()
				elseif CurrentAction == 'delete_vehicle' then
					DeleteJobVehicle()
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, 167) and IsInputDisabled(0) and not IsDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'admin' then
			OpenMobileadminActionsMenu()
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Final. Script creado por Aniol0012.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬