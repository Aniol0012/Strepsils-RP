local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed				  = false
local hasAlreadyEnteredMarker     = false
local lastZone                    = nil
local isInJoblistingMarker 		  = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function ShowProfessionMenu()
	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Surgery",
	{
	  title = '<span style="color:orange;">💼 INEM<span style="color:white;">',
	  align = "Center",
	  elements = {
		{label = '<span style="color:green;">👷 Trabajos abiertos [Sin whitelist]<span style="color:white;">', value = "choose"},
		{label = '<span style="color:red;">👮 Trabajos cerrados [Con whitelist]<span style="color:white;">', value = "apply"}
	  }
	},
	function(data, menu)
	  menu.close()
  
	  if data.current.value == "choose" then
		ShowJobListingMenu()
	  elseif data.current.value == "apply" then
		openGui()
	  end
	end,
	function(data, menu)
	  menu.close()
	end)
  end


function ShowJobListingMenu(data)
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(data)
		local elements = {}
		for i = 1, #data, 1 do
			table.insert(
				elements,
				{label = data[i].label, value = data[i].value}
			)
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'joblisting',
			{
				title    = '<span style="color:orange;">💼 INEM - <span style="color:red;">No Whitelist<span style="color:white;">',
				align = "Center",
				elements = elements
			},
			function(data, menu)
				TriggerServerEvent('esx_joblisting:setJob', data.current.value)
				local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(-1))
				ESX.ShowAdvancedNotification('~y~Oficina de Empleo', '~g~¡Tienes un nuevo empleo!', '', mugshotStr, 2) -- Hecho por Aniol0012
				UnregisterPedheadshot(mugshot) -- Esto hay que ponerlo, porque por default el juego solo te deja ponerlo 34 veces.
				menu.close()
			end,
			function(data, menu)
				menu.close()
			end
		)

	end)
end

-- MENU
function openGui()
	SendNUIMessage({openMenu = true})
	Citizen.CreateThread(function()
	  Citizen.Wait(500)
	  SetNuiFocus(true, true)
	end)
end
  
function closeGui()
	SetNuiFocus(false)
	SendNUIMessage({openMenu = false})
end
  
RegisterNUICallback('closeMenu', function(data, cb)
	closeGui()
	cb('ok')
end)
  
RegisterNUICallback('postApplication', function(data, cb)
	
	TriggerServerEvent('esx_joblisting:postApplication', data)
	
	cb('ok')
	
	local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(-1))
	ESX.ShowAdvancedNotification('~y~Oficina de Empleo', '~g~¡Has enviado tu solicitud de empleo!', '', mugshotStr, 2) -- Hecho por Aniol0012
	UnregisterPedheadshot(mugshot) -- Esto hay que ponerlo, porque por default el juego solo te deja ponerlo 34 veces.
end)
-- Menu


AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJoblistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < 2 then
				isInJoblistingMarker  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString(_U('access_job_center'))
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJoblistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJoblistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_joblisting:hasExitedMarker')
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)
		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('job_center'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and GetLastInputMethod(2) and isInJoblistingMarker and not menuIsShowed then
			ShowProfessionMenu()
		end
	end
end)
