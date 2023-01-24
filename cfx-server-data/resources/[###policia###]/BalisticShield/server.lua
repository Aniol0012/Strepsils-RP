RegisterCommand("policeS", function(source, args, raw)
    local src = source
    TriggerClientEvent("shield:TogglePoliceShield", src)
end)

RegisterCommand("sheriffS", function(source, args, raw)
    local src = source
    TriggerClientEvent("shield:ToggleSheriffShield", src)
end)

RegisterCommand("swatS", function(source, args, raw)
    local src = source
    TriggerClientEvent("shield:ToggleSwatShield", src)
end)

RegisterCommand("nooseS", function(source, args, raw)
    local src = source
    TriggerClientEvent("shield:ToggleNooseShield", src)
end)

RegisterCommand("fibS", function(source, args, raw)
    local src = source
    TriggerClientEvent("shield:ToggleFibShield", src)
end)