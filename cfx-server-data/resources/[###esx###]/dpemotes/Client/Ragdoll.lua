--[[
Documentacion:
Control: Agacharse
+ y /suelo: Suelo
Z: Levantar las manos
X: Parar animacion
B: Señalar
G: Cruzar los brazos
U: Cerrar el coche
H: Facepalm4
K: Imputado (311)
L: Esperar (Lean4), pero tambien se podria usar el (Sit6(182))
Shift + E: Shift Chair (Sentarse en una silla)
]]

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Locales▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local isInRagdoll = false
local crouched = false
local IsDead = false
local mp_pointing = false
local keyPressed = false
local once = true
local oldval = false
local oldvalped = false
local canHandsUp = true

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Muerte▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬DefaultX▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if IsControlJustReleased(0, Config.Cancelar) and Config.EnableXtoCancel and GetLastInputMethod(2) and not IsDead then
			ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if IsControlJustReleased(0, Config.CancelarEspacio) and Config.EnableXtoCancel and GetLastInputMethod(2) and not IsDead then
			ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)
]]

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if IsControlJustReleased(0, 170) then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Suelo▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
 while true do
    Citizen.Wait(10)
    if isInRagdoll then
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsControlJustPressed(2, Config.Suelo) and Config.SueloOn and not IsDead and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
        if isInRagdoll then
            isInRagdoll = false
        else
            isInRagdoll = true
            Wait(100)
        end
    end
  end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsControlJustPressed(2, Config.Cancelar) and Config.SueloOn and not IsDead then
        if isInRagdoll then
            isInRagdoll = false
        else
            --isInRagdoll = true
            Wait(100)
        end
    end
  end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsControlJustPressed(2, 32) and Config.SueloOn and not IsDead then
        if isInRagdoll then
            isInRagdoll = false
        else
            --isInRagdoll = true
            Wait(100)
        end
    end
  end
end)


RegisterCommand('suelo', function()
	if Config.SueloOn and not IsDead and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
		if isInRagdoll then
			isInRagdoll = false
		else
			isInRagdoll = true
			Wait(100)
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Agacharse▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and Config.AgacharseOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, Config.Agacharse, true ) 

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, Config.Agacharse ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Cruzar Brazos▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, Config.Cruzarbrazos) and Config.CruzarOn and not IsDead and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
				local persona = GetPlayerPed(-1)
				local quitararma = "WEAPON_UNARMED"
				SetCurrentPedWeapon(persona, quitararma, true)
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Levantar las manos▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	local handsup = false

	while true do
		Citizen.Wait(0)

		if canHandsUp then
			if IsControlJustReleased(0, Config.Levantarlasmanos) and not IsDead and Config.LevantarOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				local playerPed = PlayerPedId()
				local persona = GetPlayerPed(-1)
				local quitararma = "WEAPON_UNARMED"
				SetCurrentPedWeapon(persona, quitararma, true)

				RequestAnimDict('missminuteman_1ig_2')
				while not HasAnimDictLoaded('missminuteman_1ig_2') do
					Citizen.Wait(100)
				end

				if handsup then
					handsup = false
					ClearPedSecondaryTask(playerPed)
					TriggerServerEvent('esx_thief:update', handsup)
				else
					handsup = true
					TaskPlayAnim(playerPed, 'missminuteman_1ig_2', 'handsup_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
					TriggerServerEvent('esx_thief:update', handsup)
				end
			end
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Señalar▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

local function startPointing()
    local ped = GetPlayerPed(-1)
	local noweapon = "WEAPON_UNARMED"
	SetCurrentPedWeapon(ped, noweapon, true)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped,29, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
	local noweapon = "WEAPON_UNARMED"
	SetCurrentPedWeapon(ped, noweapon, true)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 29, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, Config.Senalar) and not mp_pointing and not IsDead and Config.SenalarOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                Wait(200)
                if not IsControlPressed(0, Config.Senalar) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, Config.Senalar) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, Config.Senalar) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, Config.Senalar) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Cerrar Coche▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(1, Config.CerrarCoche) and not IsDead and Config.CerrarCocheOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
		local persona = GetPlayerPed(-1)
		local quitararma = "WEAPON_UNARMED"
		SetCurrentPedWeapon(persona, quitararma, true)
		
		PlayAnimation(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click", {
            ["speed"] = 8.0,
            ["speedMultiplier"] = 8.0,
            ["duration"] = 1820,
            ["flag"] = 49,
            ["playbackRate"] = false
        })
		end
	end
end)
	
PlayAnimation = function(ped, dict, anim, settings)
	if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end

            if settings == nil then
                TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
            else 
                local speed = 1.0
                local speedMultiplier = -1.0
                local duration = 1.0
                local flag = 0
                local playbackRate = 0

                if settings["speed"] then
                    speed = settings["speed"]
                end

                if settings["speedMultiplier"] then
                    speedMultiplier = settings["speedMultiplier"]
                end

                if settings["duration"] then
                    duration = settings["duration"]
                end

                if settings["flag"] then
                    flag = settings["flag"]
                end

                if settings["playbackRate"] then
                    playbackRate = settings["playbackRate"]
                end

                TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
            end
      
            RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Facepalm▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
--[[
Citizen.CreateThread(function()
	local facepalm = false

	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Config.Facepalm) and not IsDead and Config.FacepalmOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local playerPed = PlayerPedId()
			local persona = GetPlayerPed(-1)
			local quitararma = "WEAPON_UNARMED"
			SetCurrentPedWeapon(persona, quitararma, true)

			RequestAnimDict('anim@mp_player_intupperface_palm')
			while not HasAnimDictLoaded('anim@mp_player_intupperface_palm') do
				Citizen.Wait(100)
			end
				
			if facepalm then
				facepalm = false
				ClearPedSecondaryTask(playerPed)
			else
				facepalm = true
				TaskPlayAnim(playerPed, 'anim@mp_player_intupperface_palm', 'idle_a', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
			end
		end
	end
end)]]

Citizen.CreateThread(function()
	local facepalm = false

	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		
		if IsControlJustReleased(0, Config.Facepalm) and not IsDead and Config.FacepalmOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local playerPed = PlayerPedId()
			local persona = GetPlayerPed(-1)
			local quitararma = "WEAPON_UNARMED"
			SetCurrentPedWeapon(persona, quitararma, true)
			if (GetEntityModel(ped) == GetHashKey("mp_m_freemode_01")) then
                RequestAnimDict('anim@mp_player_intcelebrationmale@face_palm')  
                while not HasAnimDictLoaded('anim@mp_player_intcelebrationmale@face_palm') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_player_intcelebrationmale@face_palm', 'face_palm', 1.0, 1.0, -1, 8, -1, true, true, true)
            elseif (GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
                RequestAnimDict('anim@mp_player_intcelebrationfemale@face_palm')  
                while not HasAnimDictLoaded('anim@mp_player_intcelebrationfemale@face_palm') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_player_intcelebrationfemale@face_palm', 'face_palm', 1.0, 1.0, -1, 8, -1, true, true, true)
            else
                RequestAnimDict('anim@mp_player_intcelebrationmale@face_palm')  
                while not HasAnimDictLoaded('anim@mp_player_intcelebrationmale@face_palm') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_player_intcelebrationmale@face_palm', 'face_palm', 1.0, 1.0, -1, 8, -1, true, true, true)
            end
		end
	end
end)

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Esperando▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	local esperando = false
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Config.Esperando) and not IsDead and Config.EsperandoOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local player = GetPlayerPed( -1 )
			local playerPed = PlayerPedId()
			local persona = GetPlayerPed(-1)
			local quitararma = "WEAPON_UNARMED"
			SetCurrentPedWeapon(persona, quitararma, true)
			if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
				if ( IsEntityPlayingAnim( player, "timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) ) then 
					esperando = false
					RemoveAnimDict(dict)
					ClearPedSecondaryTask(playerPed)
				else
					TaskPlayAnim( player, "timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (1000)
					esperando = true
				end
			end    
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if IsControlJustReleased(0, Config.Esperando) and Config.EsperandoOn and GetLastInputMethod(2) and not IsDead then
			ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)

function loadAnimDict( dict )
while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 5 )
end
end 

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Arrestado▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	local handsup = false
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Config.Arrestado) and not IsDead and Config.ArrestadoOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local player = GetPlayerPed( -1 )
			local persona = GetPlayerPed(-1)
			local quitararma = "WEAPON_UNARMED"
			SetCurrentPedWeapon(persona, quitararma, true)
			if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
				loadAnimDict( "random@arrests" )
				loadAnimDict( "random@arrests@busted" )
				if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
					TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (3000)
					TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
					handsup = false
					TriggerServerEvent("esx_thief:update", handsup)
				else
					TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (4000)
					TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (500)
					TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (1000)
					TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
					handsup = true
					TriggerServerEvent("esx_thief:update", handsup)
				end
			end    
		end
	end
end)

function loadAnimDict( dict )
while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 5 )
end
end 

Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
	if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
		DisableControlAction(1, 140, true)
		DisableControlAction(1, 141, true)
		DisableControlAction(1, 142, true)
		DisableControlAction(0,21,true)
	end
end
end)

-- Para el comando 

RegisterNetEvent( 'strepsils_arrestado' )
AddEventHandler( 'strepsils_arrestado', function()
    local player = GetPlayerPed( -1 )
	local persona = GetPlayerPed(-1)
	local quitararma = "WEAPON_UNARMED"
	SetCurrentPedWeapon(persona, quitararma, true)
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end )

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Sentarse▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Citizen.CreateThread(function()
	local sentado = false
	while true do
		Citizen.Wait(0)

		if IsControlJustPressed(0, Config.Sentado) and IsControlPressed(0, Config.Sentado2) and not IsDead and Config.SentadoOn and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local player = GetPlayerPed( -1 )
			local playerPed = PlayerPedId()
			if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
				if ( IsEntityPlayingAnim( player, "timetable@ron@ig_5_p3", "ig_5_p3_base", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) ) then --"amb@prop_human_seat_chair_mp@male@generic@base", "base", 
					sentado = false
					RemoveAnimDict(dict)
					ClearPedSecondaryTask(playerPed)
				else
					TaskPlayAnim( player, "timetable@ron@ig_5_p3", "ig_5_p3_base", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (1000)
					sentado = true
				end
			end    
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if IsControlJustPressed(0, Config.Sentado) and Config.SentadoOn and GetLastInputMethod(2) and not IsDead then
			ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)

function loadAnimDict( dict )
while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 5 )
end
end 

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
