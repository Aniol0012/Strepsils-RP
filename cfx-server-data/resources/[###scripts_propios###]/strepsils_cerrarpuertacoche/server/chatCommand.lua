if(globalConf["SERVER"].enableGiveKey)then
    RegisterCommand('darllave', function(source, args, rawCommand)
        local src = source
        local identifier = GetPlayerIdentifiers(src)[1]

        if(args[1])then
            local targetId = args[1]
            local targetIdentifier = GetPlayerIdentifiers(targetId)[1]
            if(targetIdentifier)then
                if(targetIdentifier ~= identifier)then
                    if(args[2])then
                        local plate = string.lower(args[2])
                        if(owners[plate])then
                            if(owners[plate] == identifier)then
                                alreadyHas = false
                                for k, v in pairs(secondOwners) do
                                    if(k == plate)then
                                        for _, val in ipairs(v) do
                                            if(val == targetIdentifier)then
                                                alreadyHas = true
                                            end
                                        end
                                    end
                                end

                                if(not alreadyHas)then
                                    TriggerClientEvent("ls:giveKeys", targetIdentifier, plate)
                                    TriggerEvent("ls:addSecondOwner", targetIdentifier, plate)

                                    TriggerClientEvent("ls:notify", targetId, "Has recibido las llaves de este vehículo " .. plate .. " por " .. GetPlayerName(src))
                                    TriggerClientEvent("ls:notify", src, "Has dado las llaves del vehiculo " .. plate .. " a " .. GetPlayerName(targetId))
                                else
                                    TriggerClientEvent("ls:notify", src, "La targeta aún tiene las llaves del vehículo")
                                    TriggerClientEvent("ls:notify", targetId, GetPlayerName(src) .. " ha tratado de darte las llaves de su vehículo, pero ya tienes unas")
                                end
                            else
                                TriggerClientEvent("ls:notify", src, "Este no es tu vehículo")
                            end
                        else
                            TriggerClientEvent("ls:notify", src, "El vehículo con esta matricula no existe")
                        end
                    else
                        TriggerClientEvent("ls:notify", src, "Te falta poner esto: /darllave <id> <matricula>")
                    end
                else
                    TriggerClientEvent("ls:notify", src, "No te puedes selecionar a ti mismo")
                end
            else
                TriggerClientEvent("ls:notify", src, "Jugador no encontrado")
            end
        else
            TriggerClientEvent("ls:notify", src, 'Te falta poner esto: /darllave <id> <matricula>')
        end

        CancelEvent()
    end)
end
