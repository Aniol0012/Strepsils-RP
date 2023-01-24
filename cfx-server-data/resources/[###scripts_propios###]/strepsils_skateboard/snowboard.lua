local OnSnowboard = false
local vehicle = nil
local prop = "p_defilied_ragdoll_01_s"
local bike = "tribike"
local board = nil
local targetPed = nil

function playAnim(anim, dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
end

local pickup = false

Citizen.CreateThread(
    function()
        while true do
            Wait(5)
            if pickup then
                if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(board)) < 1.5 then
                    HelpText(
                        Config["translation"].use,
                        vector3(GetEntityCoords(board).x, GetEntityCoords(board).y, GetEntityCoords(board).z - 0.75)
                    )
                    if IsControlJustReleased(0, 47) then
                        TriggerEvent("kepo_snowboard:toggleBoard", "deploy")
                        pickup = false
                    elseif IsControlJustReleased(0, 38) then
                        DeleteEntity(board)
                        pickup = false
                    end
                end
            elseif OnSnowboard then
                if IsControlJustPressed(0, 47) then
                    TriggerEvent("kepo_snowboard:toggleBoard", "remove")
                    pickup = false
                end
            end
        end
    end
)

RegisterCommand(
    "snowboard",
    function(source, args, rawCommand)
        if not OnSnowboard then
            if not pickup then
                TriggerEvent("kepo_snowboard:pickUp")
            else
                DeleteEntity(board)
                TriggerEvent("kepo_snowboard:pickUp")
            end
        end
    end
)

RegisterNetEvent("kepo_snowboard:pickUp")
AddEventHandler(
    "kepo_snowboard:pickUp",
    function()
        local pedcoords, heading =
            GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0,
            GetEntityHeading(PlayerPedId()) + 90.0
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            return
        end
        board = CreateObject(GetHashKey(prop), pedcoords.x, pedcoords.y, pedcoords.z - 1.035, false, true, true)
        PlaceObjectOnGroundProperly(board)

        while not DoesEntityExist(board) do
            Citizen.Wait(5)
        end
        pickup = true
    end
)

RegisterNetEvent("kepo_snowboard:toggleBoard")
AddEventHandler(
    "kepo_snowboard:toggleBoard",
    function(toggle)
        if toggle == "deploy" then
            DisableAllControlActions(1)

            local ped = PlayerPedId()
            local pedcoords, heading =
                GetEntityCoords(ped) + GetEntityForwardVector(PlayerPedId()) * 2.0,
                GetEntityHeading(PlayerPedId()) + 90.0
            local CurrentVehicle = GetVehiclePedIsIn(ped, false)

            playAnim("pickup_low", "pickup_object")

            local bikehash = GetHashKey(bike)

            local delay1 = GetGameTimer()

            while not DoesEntityExist(board) do
                Citizen.Wait(5)
            end

            for i = 1, 80.0 do
                Wait(1)
                AttachEntityToEntity(
                    board,
                    ped,
                    GetPedBoneIndex(PlayerPedId(), 28422),
                    0.0,
                    0.0,
                    -0.15,
                    180.0 + i,
                    180.0,
                    270.0,
                    1,
                    1,
                    0,
                    0,
                    2,
                    1
                )
            end

            local delay2 = GetGameTimer()

            -- Wait((GetAnimDuration("pickup_object", "pickup_low") * 1000) / 2 + (delay1-delay2))

            DetachEntity(board)
            PlaceObjectOnGroundProperly(board)

            -- Wait((GetAnimDuration("pickup_object", "pickup_low") * 1000) / 2)
            while not HasModelLoaded(bikehash) do
                RequestModel(bikehash)
                Wait(1)
            end

            vehicle = CreateVehicle(bikehash, pedcoords, heading, true, false)

            while not DoesEntityExist(vehicle) do
                Citizen.Wait(5)
            end
            local pedlol = GetHashKey("mp_m_freemode_01")

            while not HasModelLoaded(pedlol) do
                RequestModel(pedlol)
                Wait(1)
            end
            targetPed = CreatePed(5, pedlol, GetEntityCoords(PlayerPedId()), 0.0, true, true)
            SetEntityInvincible(targetPed, true)
            FreezeEntityPosition(targetPed, true)
            SetPedAlertness(targetPed, 0.0)
            SetAllVehiclesSpawn(ped, true, true, true, true)
            

            TaskWarpPedIntoVehicle(targetPed, vehicle, -1)

            while not IsPedInVehicle(targetPed, vehicle) do
                Wait(0)
            end

            RequestAnimDict("move_strafe@stealth")
            while not HasAnimDictLoaded("move_strafe@stealth") do
                Wait(10)
            end

            FreezeEntityPosition(targetPed, true)
            AttachEntityToEntity(
                board,
                ped,
                GetPedBoneIndex(ped, 24806),
                0.35,
                0.0,
                -0.12,
                0.0,
                0.0,
                0.0,
                true,
                true,
                true,
                true,
                1,
                true
            )
            SetEntityNoCollisionEntity(vehicle, ped, false)
            SetEntityCollision(board, false, false)
            TaskPlayAnim(ped, "move_strafe@stealth", "idle", 8.0, -8.0, -1, 17, 0, false, false, false)
            AttachEntityToEntity(ped, vehicle, GetEntityBoneIndexByName(vehicle, "bodyshell"), 0.0, 0.0, 0.45, 0.0, 0.0, -15.0, true, true, true, true, true, true)
            SetEntityVisible(vehicle, false)

            Wait(10)
            OnSnowboard = true
            EnableAllControlActions(1)
        elseif toggle == "remove" then
            if DoesEntityExist(vehicle) and DoesEntityExist(board) then
                while DoesEntityExist(vehicle) do
                    Wait(0)
                    DeleteEntity(vehicle)
                    DeleteEntity(board)
                    DetachEntity(targetPed)
                end
                OnSnowboard = false
                ClearPedTasksImmediately(PlayerPedId())
            end

        elseif toggle == "fell" then
            if DoesEntityExist(vehicle) or DoesEntityExist(targetPed) then
                while DoesEntityExist(vehicle) or DoesEntityExist(targetPed) do
                    Wait(0)
                    DeleteEntity(vehicle)
                    DeleteEntity(targetPed)
                end
                DetachEntity(board)
                PlaceObjectOnGroundProperly(board)
                OnSnowboard = false
                SetPedToRagdoll(PlayerPedId(), 4000, 4000, 0, true, true, false)
                Wait(4000)
                pickup = true
            end
        end
    end
)

function LoadAnimation(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end

local isInAir = false

Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if OnSnowboard then
                if not IsEntityInAir(vehicle) then
                    isInAir = false
                    AttachEntityToEntity(
                        board,
                        PlayerPedId(),
                        GetPedBoneIndex(PlayerPedId(), 24806),
                        0.35,
                        0.0,
                        -0.12,
                        0.0,
                        0.0,
                        0.0,
                        true,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                else
                    Wait(250)
                    if IsEntityInAir(vehicle) then
                        isInAir = true
                        AttachEntityToEntity(
                            board,
                            PlayerPedId(),
                            GetPedBoneIndex(PlayerPedId(), 24806),
                            0.35,
                            -0.15,
                            -0.12,
                            -15.0,
                            0.0,
                            -4.5,
                            true,
                            true,
                            true,
                            true,
                            1,
                            true
                        )
                    end
                end
            end
        end
    end
)



Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if OnSnowboard then
                ForcePedMotionState(PlayerPedId(), 1110276645, 1, 1, 1)
                -- ForcePedMotionState(targetPed, 1110276645, 1, 1, 1)

                if IsControlPressed(1, 102) and not isInAir and GetEntitySpeed(vehicle) <= 2.5 then
                    local speed = GetEntitySpeed(vehicle)
                    SetVehicleForwardSpeed(vehicle, 2.5)
                end

                if isInAir then
                    Crouch()
                    HelpText(Config["translation"].inAirSnowboard)
                else
                    HelpText(Config["translation"].onGroundSnowboard)
                    ClearPedSecondaryTask(PlayerPedId())
                end
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if OnSnowboard then
                if HasEntityCollidedWithAnything(vehicle) then
                    Wait(250)
                    if HasEntityCollidedWithAnything(vehicle) and GetEntitySpeed(vehicle) >= 4.5 then
                        SetPedToRagdoll(PlayerPedId(), 4000, 4000, 0, true, true, false)
                        TriggerEvent("kepo_snowboard:toggleBoard", "fell")
                    end
                end
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Wait(5)
            if OnSnowboard then
                DisableControlAction(0, 86, true)
                local rot = GetEntityRotation(vehicle, 2)
                local rot2 = GetEntityRotation(vehicle)


                -- if (-90.0 < rot2.x and rot2.x > 90.0) or (-90.0 < rot2.y and rot2.y > 90.0) and not IsEntityInAir(vehicle) then
                    
                --     SetPedToRagdoll(PlayerPedId(), 4000, 4000, 0, true, true, false)
                --     TriggerEvent("kepo_snowboard:toggleBoard", "fell")
                -- end


                if isInAir then
                    if IsControlPressed(1, 34) then
                        SetEntityRotation(vehicle, rot[1], rot[2], rot[3] + 2.0, 2, true)
                    end

                    if IsControlPressed(1, 30) then
                        SetEntityRotation(vehicle, rot[1], rot[2], rot[3] - 2.0, 2, true)
                    end

                    if IsControlPressed(0, 44) then
                        SetEntityRotation(vehicle, rot[1], rot[2] - 2.5, rot[3], 2, true)
                    end

                    if IsControlPressed(0, 38) then
                        SetEntityRotation(vehicle, rot[1], rot[2] + 2.5, rot[3], 2, true)
                    end

                    if IsControlPressed(0, 32) then
                        SetEntityRotation(vehicle, rot2[1] - 2.0, rot2[2], rot2[3])
                    end

                    if IsControlPressed(0, 33) then
                        SetEntityRotation(vehicle, rot2[1] + 2.0, rot2[2], rot2[3])
                    end

                    if IsControlPressed(0, 32) and IsControlPressed(1, 34) then
                        SetEntityRotation(vehicle, rot2[1] - 2.0, rot2[2], rot2[3] + 2.0)
                    end

                    if IsControlPressed(0, 32) and IsControlPressed(1, 30) then
                        SetEntityRotation(vehicle, rot2[1] - 2.0, rot2[2], rot2[3] - 2.0)
                    end

                    if IsControlPressed(0, 33) and IsControlPressed(1, 34) then
                        SetEntityRotation(vehicle, rot2[1] + 2.0, rot2[2], rot2[3] + 2.0)
                    end

                    if IsControlPressed(0, 33) and IsControlPressed(1, 30) then
                        SetEntityRotation(vehicle, rot2[1] + 2.0, rot2[2], rot2[3] - 2.0)
                    end

                    if IsControlPressed(0, 32) and IsControlPressed(0, 44) then
                        SetEntityRotation(vehicle, rot2[1] - 2.0, rot2[2] - 2.5, rot2[3])
                    end

                    if IsControlPressed(0, 32) and IsControlPressed(0, 44) then
                        SetEntityRotation(vehicle, rot2[1] - 2.0, rot2[2] - 2.5, rot2[3])
                    end

                    if IsControlPressed(0, 33) and IsControlPressed(0, 44) then
                        SetEntityRotation(vehicle, rot2[1] + 2.0, rot2[2] - 2.5, rot2[3])
                    end

                    if IsControlPressed(0, 33) and IsControlPressed(0, 44) then
                        SetEntityRotation(vehicle, rot2[1] + 2.0, rot2[2] - 2.5, rot2[3])
                    end
                elseif (rot[2] > 45.0 or rot[2] < -45.0 or rot[1] > 90.0 or rot[1] < - 90.0) and not isInAir then
                    TriggerEvent("kepo_snowboard:toggleBoard", "fell")
                elseif not IsPedInVehicle(targetPed, vehicle, true) and rot2[1] < 80.0 and rot2[1] > -80.0 then
                     PlaceObjectOnGroundProperly(vehicle)
                    TaskWarpPedIntoVehicle(targetPed, vehicle, -1)
                end
                if IsControlPressed(1, 34) and GetEntitySpeed(vehicle) >= 1.5 then
                    SetEntityRotation(vehicle, rot[1], rot[2], rot[3] + 1.5, 2, true)
                end

                if IsControlPressed(1, 30) and GetEntitySpeed(vehicle) >= 1.5 then
                    SetEntityRotation(vehicle, rot[1], rot[2], rot[3] - 1.5, 2, true)
                end
            end
        end
    end
)

function Crouch()
    RequestAnimDict("move_crouch_proto")
    while not HasAnimDictLoaded("move_crouch_proto") do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), "move_crouch_proto", "idle", 8.0, 8.0, -1, 35, 0, 0, 0, 0)
end

HelpText = function(msg, coords)
    if not coords then
        AddTextEntry(GetCurrentResourceName(), msg)
        DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
    else
        DrawText3D(coords, string.gsub(msg, "~INPUT_CONTEXT~", "~r~[~w~E~r~]~w~"), 0.35)
    end
end

DrawText3D = function(coords, text, scale)
    coords = coords + vector3(0.0, 0.0, 1.2)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 41, 41, 125)
end
