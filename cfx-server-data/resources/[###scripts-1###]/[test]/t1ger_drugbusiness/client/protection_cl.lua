-- Code goes here:

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if insideShell then
            NetworkOverrideClockTime(23, 0, 0)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist('EXTRASUNNY')
            SetWeatherTypeNow('EXTRASUNNY')
            SetWeatherTypeNowPersist('EXTRASUNNY')
            SetRainFxIntensity(0.0)
        end
    end
end)

RegisterNetEvent('t1ger_drugbusiness:JobDataCL')
AddEventHandler('t1ger_drugbusiness:JobDataCL',function(data)
    Config.StealSupplies = data
end)

RegisterNetEvent('t1ger_drugbusiness:SellJobDataCL')
AddEventHandler('t1ger_drugbusiness:SellJobDataCL',function(data)
    Config.SellStock = data
end)

RegisterNetEvent('t1ger_drugbusiness:productionTime')
AddEventHandler('t1ger_drugbusiness:productionTime', function()
    local ownsLab = false
    if plyLabID ~= 0 then
        ownsLab = true
    else
        ownsLab = false
    end
    while ownsLab do
        Citizen.Wait((Config.ProductionMinutes * 1000 * 60))
        TriggerServerEvent('t1ger_drugbusiness:suppliesToStock',plyLabID)
    end
end)

-- Get Safe Spawn Pos for Shell:
function GetSafeSpawn(pos)
    local ObjectNearPoint = IsAnyObjectNearPoint(pos[1], pos[2], pos[3]-30.0, 50.0, false)
    Wait(250)
    local spawnPos = {pos[1], pos[2], pos[3]-30.0}
    if ObjectNearPoint then
        while ObjectNearPoint do
            Citizen.Wait(1)
            spawnPos = {(spawnPos[1]+20.0), spawnPos[2], (spawnPos[3]-30.0)}
            ObjectNearPoint = IsAnyObjectNearPoint(spawnPos[1], spawnPos[2], (spawnPos[3]), 35.0, false)
            if not ObjectNearPoint then
                break
            end
        end
        return spawnPos
    else
        return spawnPos
    end
end
