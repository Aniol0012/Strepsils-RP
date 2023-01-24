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

local isHide = true -- Esto determina si por default esta abierto o cerrado

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		
		if playerPed and not isHide then
			
			playerCar = GetVehiclePedIsIn(playerPed, false)
			
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				
				carRPM                    = GetVehicleCurrentRpm(playerCar)
				carSpeed                  = GetEntitySpeed(playerCar)
				carGear                   = GetVehicleCurrentGear(playerCar)
				carIL                     = GetVehicleIndicatorLights(playerCar)
				carHandbrake              = GetVehicleHandbrake(playerCar)
				carBrakePressure          = GetVehicleWheelBrakePressure(playerCar, 0)
				carLS_r, carLS_o, carLS_h = GetVehicleLightsState(playerCar)
				
				SendNUIMessage({
					ShowHud             = true,
					CurrentCarRPM       = carRPM,
					CurrentCarGear      = carGear,
					CurrentCarSpeed     = carSpeed,
					CurrentCarKmh       = math.ceil(carSpeed * 3.6),
					CurrentCarMph       = math.ceil(carSpeed * 2.236936),
					CurrentCarIL        = carIL,
					CurrentCarHandbrake = carHandbrake,
					CurrentCarBrake     = carBrakePressure,
					CurrentCarLS_r      = carLS_r,
					CurrentCarLS_o      = carLS_o,
					CurrentCarLS_h      = carLS_h,
					PlayerID            = GetPlayerServerId(GetPlayerIndex())
				})
				
			else
				SendNUIMessage({HideHud = true})
			end
		end
	end
end)

--[[ -- Esto hace que con el F9 actives o desactives el cuentakilometros.

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustPressed(1, 56) then -- F9
			if isHide then
				isHide = false
			else
				SendNUIMessage({HideHud = true})
				isHide = true
			end
		end
	end
end)
]]

--[[
RegisterCommand("cuentakilometros", function(source, args, rawCommand)
	toggleSpeedo()
end, false)
]]

function toggleSpeedo(state)
	if isHide then
		isHide = false
		TriggerEvent('strepsils_cerrar_cuentakilometros2')	
	else
		SendNUIMessage({HideHud = true})
		isHide = true
		TriggerEvent('strepsils_cerrar_cuentakilometros2')		
	end
end

RegisterNetEvent('coche:cuentakilometros')
AddEventHandler('coche:cuentakilometros', function()
	toggleSpeedo()
end)

RegisterNetEvent('strepsils_cerrar_cuentakilometros_carreras')
AddEventHandler('strepsils_cerrar_cuentakilometros_carreras', function()
	if not isHide then
		SendNUIMessage({HideHud = true})
		isHide = true
	end
	metersVisible = false
end)


--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Car hud, esto no es el cuentakilometros.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local metersVisible = true

local HUD = {
	
	Speed 			= 'kmh', 	-- kmh or mph

	DamageSystem 	= false, 

	SpeedIndicator 	= false,

	ParkIndicator 	= false,

	Top 			= false,  	-- ALL TOP PANAL ( oil, dsc, plate, fluid, ac )

	Plate 			= false, 	-- Only if Top is false and you want to keep Plate Number

	Engine			= false,  	-- Engine Status off/on
	
	Cruise			= false,  	-- Enables/Disables The CRUISE Control status (default key F9)
	
	CarRPM			= false,  	-- Enables/Disables The RPM status of the car
	
	CarGears		= false,  	-- Enables/Disables The status of the gears of the car
	
	RaceMode		= false, 	-- Enables/Disables The Race Mode HUD
	
	RaceMode2		= false,	-- Enables/Disables The Race Mode HUD 2, only if the Race Mode is false
	
	RaceMode3		= false,	-- Enables/Disables The Race Mode HUD 3, only if the Race Mode and RaceMode2 are false - NEW
	
	SeatBelt		= false,		-- Enables/Disables The seatbelt option (default key K) - NEW
	
	Indicators		= false,		-- Enables/Disables The indicators option - NEW

}

local HUDPlane = {
	
	PlaneSpeed 		= false,		-- Enables/Disables The hud for the heli or plane speed
	
	Panel 			= true,		-- Enagles/Disables The heli or plane panel
	
}

-- Move the entire UI
local UI = { 

	x =  0.008 ,	-- Base Screen Coords 	+ 	 x
	y = -0.120 ,	-- Base Screen Coords 	+ 	-y

}

-- Move the entire Race Mode or Race Mode2 or RaceMode3
local RM = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x 				Default: x = 0.000 ,
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y				Default: y = -0.001 ,

}

-- Change this if you want
local cruisekey = 56 -- F9
local seatbeltkey = 311 -- K
local EngineHpBroken = 110
local EngineHpAlmostBroken = 370
local BodyHpBroken = 50

-- Don't touch this
local cruisecolor  	  = false
local carspeed 	   	  = nil
local speedBuffer  	  = {}
local velBuffer    	  = {}
local beltOn		  = false
local wasInCar    	  = false

-- ################################### --
--									   --
--             C   O   D   E           --
--									   --
-- ################################### --

IsCar = function(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

Fwv = function (entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
	while true do Citizen.Wait(1)


		local MyPed = GetPlayerPed(-1)
		local PedHeli = IsPedInAnyHeli(MyPed)											-- Checks if the PED is in any Heli
		local PedPlane = IsPedInAnyPlane(MyPed)											-- Checks if the PEd is in any Plane
		local PedBoat = IsPedInAnyBoat(MyPed)											-- Checks if the PED is in any Boat
		local PedBike = IsPedOnAnyBike(MyPed)											-- Checks if the PED is in any Bike or Bicycle
		
		if(IsPedInAnyVehicle(MyPed, false)) then
			
			local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)
			local VehStopped = IsVehicleStopped(MyPedVeh)
			local VehEngineHP = GetVehicleEngineHealth(MyPedVeh) 
			local VehBodyHP = GetVehicleBodyHealth(MyPedVeh)
			local VehBurnout = IsVehicleInBurnout(MyPedVeh)
	--  #### 		   EDITED IN			  ####  --
			local Gear = GetVehicleCurrentGear(MyPedVeh)								-- Check the current gear of the vehicle
            local RPM = GetVehicleCurrentRpm(MyPedVeh)									-- Check the rpm of the vehicle
			local model = GetVehicleClass(MyPedVeh)										-- Check the vehicle class/model
			local driverseat = IsVehicleSeatFree(MyPedVeh)								-- Driver Seat
			local Indicator = GetVehicleIndicatorLights(MyPedVeh)						-- Check the state of the indicators
			local _,llightson,lhighbeams = GetVehicleLightsState(MyPedVeh, 0)			-- Left Beams
			local _,rlightson,rhighbeams = GetVehicleLightsState(MyPedVeh, 1)			-- Right Beams
			local Passenger1 = GetVehicleNumberOfPassengers(MyPedVeh, 0)				-- Seat Right Front
			local Passenger2 = GetVehicleNumberOfPassengers(MyPedVeh, 1)				-- Seat Left Back
			local Passenger3 = GetVehicleNumberOfPassengers(MyPedVeh, 2)				-- Seat Right Back

			local Height = GetEntityHeightAboveGround(MyPedVeh)							-- Check the height above the ground
	--  #### SOME STUFF THAT YOU CAN'T CHANGE ####  --
			if RPM > 0.99 then
				RPM = RPM*100
				RPM = RPM+math.random(-2,2)
				RPM = RPM/100
			end
	--  ####         END OF RACE MODE3	  	  ####  --
	--  ####         	 PLANE HUD	  	  	  ####  --
			if PedPlane then
				if HUDPlane.PlaneSpeed then
					drawRct(UI.x + 0.11, 	UI.y + 0.932, 0.046,0.03,0,0,0,150)
					Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ knots", 255, 255, 255, 255)
				else
					speed = 0.0
				end
				
				if HUDPlane.Panel then
					--drawTxt(UI.x + 0.514, UI.y + 1.264, 1.0,1.0,0.44, "Roll: " .. math.ceil(Roll), 255, 255, 255, 200)
				
					drawTxt(UI.x + 0.5120, UI.y + 1.41620, 1.0,1.0,0.55, "Altura: " .. math.ceil(Height) .. " m", 255, 255, 255, 200)
				
				end
			end
			
			if PedHeli then
				if HUDPlane.PlaneSpeed then
					drawRct(UI.x + 0.11, 	UI.y + 0.932, 0.046,0.03,0,0,0,150)
					Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ knots", 255, 255, 255, 255)
				else
					speed = 0.0
				end
				
				if HUDPlane.Panel and metersVisible then
					drawTxt(UI.x + 0.5120, UI.y + 1.41620, 1.0,1.0,0.55, "Altura: " .. math.ceil(Height) .. " m", 255, 255, 255, 200)
					--miid(0.815, 1.435, 1.0,1.0,0.50, "~g~Altura:~r~  ".. math.ceil(Height) .. 'm', 255, 255, 255, 255)
				end
			end
	--  ####         	 PLANE HUD	  	  	  ####  --			

			
			if HUD.Top and PedHeli == false and PedPlane == false and PedBoat == false then
				--drawTxt(UI.x + 0.563, 	UI.y + 1.2624, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
  
				if HUD.ParkIndicator and PedHeli == false and PedPlane == false and PedBoat == false then
					if VehStopped then
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.6605, UI.y + 1.262, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			else
				if HUD.Plate and PedHeli == false and PedPlane == false and PedBoat == false then
					--drawTxt(UI.x + 0.5120, 	UI.y + 1.41620, 1.0,1.0,0.55, "~w~" .. PlateVeh, 255, 255, 255, 255)
				end
				if HUD.ParkIndicator and PedHeli == false and PedPlane == false and PedBoat == false then

					if VehStopped then
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			end
			
			if HUD.Engine and PedHeli == false and PedPlane == false and PedBoat == false then
				if EngineRunning then
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 0, 255, 0,200) -- ENG green
				else
					drawTxt(UI.x + 0.619, UI.y + 1.245, 1.0,1.0,0.45, "ENG", 255, 0, 0, 200) -- ENG red
					RPM = 0
				end
			end
			
			if HUD.SpeedIndicator and PedHeli == false and PedPlane == false and PedBoat == false then
				drawRct(UI.x + 0.11, 	UI.y + 0.932, 0.046,0.03,0,0,0,150) -- Speed panel
				if HUD.Speed == 'kmh' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ km/h", 255, 255, 255, 255)
				elseif HUD.Speed == 'mph' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ mph", 255, 255, 255, 255)
				else
					drawTxt(UI.x + 0.81, 	UI.y + 1.42, 1.0,1.0,0.64 , [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)
				end
			end
			
			if HUD.DamageSystem and PedHeli == false and PedPlane == false and PedBoat == false then
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,0.173,0,0,0,100)
				drawRct(UI.x + 0.1661, 	UI.y + 0.809, 0.005,VehBodyHP/5800,0,0,0,100)
				drawRct(UI.x + 0.159, 	UI.y + 0.809, 0.005, VehEngineHP / 5800,0,0,0,100)
			end
			

		end		
	end
end)

function miid(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/1.25, y - height/2 + 0.005)
end


function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- Final. Script modificado por Aniol0012.
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬