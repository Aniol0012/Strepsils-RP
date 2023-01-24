RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('_chat:messageEnteredP')
RegisterServerEvent('_chat:messageEnteredM')
RegisterServerEvent('_chat:messageEnteredG')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

ESX = nil 

Citizen.CreateThread(function()
    while ESX == nil do 
        Wait(1)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)


AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
    end

    print(author .. '^7: ' .. message .. '^7')
end)

AddEventHandler('_chat:messageEnteredP', function(author, color, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then 
        if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageP', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageP', -1, "^3" .. author .. " ^7[^4CNP^7]",  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
    elseif xPlayer.job.name == 'admin' then
		if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageP', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageP', -1, "^1" .. author .. " ^7[^6ADMINISTRADOR^7]",  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
	
	else
        TriggerClientEvent('esx:showNotification', source, 'No eres Policía')
    end
end)

AddEventHandler('_chat:messageEnteredM', function(author, color, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'ambulance' then 
        if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageM', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageM', -1, "^3" .. author .. " ^7[^1EMS^7]",  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
		
    elseif xPlayer.job.name == 'admin' then
		if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageM', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageM', -1, "^1" .. author .. " ^7[^6ADMINISTRADOR^7]",  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
	else 
        TriggerClientEvent('esx:showNotification', source, 'No eres EMS')
    end
end)

AddEventHandler('_chat:messageEnteredG', function(author, color, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'admin' then 
        if not message or not author then
            return
        end
    
        TriggerEvent('chatMessageG', source, author, message)
    
        if not WasEventCanceled() then
            TriggerClientEvent('chatMessageG', -1, "^1" .. author .. " ^7[^6ADMINISTRADOR^7]",  { 255, 255, 255 }, message)
        end
    
        print(author .. '^7: ' .. message .. '^7')
    else 
        TriggerClientEvent('esx:showNotification', source, 'No eres Administrador')
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('chat:init', function()
    TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. GetPlayerName(source) .. ' ^2se ha unido.')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. GetPlayerName(source) ..' ^1se ha ido.')
	--TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. GetPlayerName(source) ..' ^1se ha ido ^4(' .. reason .. ')')
end)

RegisterServerEvent('playerDied')
AddEventHandler('playerDied',function(killer,reason)
	if killer == "**Invalid**" then --Can't figure out what's generating invalid, it's late. If you figure it out, let me know. I just handle it as a string for now.
		reason = 2
	end
	if reason == 0 then
		TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. GetPlayerName(source) ..' ^1se ha suicidado.')
	elseif reason == 1 then
		TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. killer ..' ^1ha asesinado a ^6'..GetPlayerName(source)..'^7.')
		--TriggerClientEvent('showNotification', -1,"~o~".. killer .. "~w~ ha asesinado a ~o~"..GetPlayerName(source).."~w~.")
	else
		TriggerClientEvent('chatMessageG', -1, '', { 255, 255, 255 }, '^6 ' .. GetPlayerName(source) ..' ^1ha muerto.')
		--TriggerClientEvent('showNotification', -1,"~o~".. GetPlayerName(source).."~w~ Muerto")
	end
end)


RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and '^2STREPSILS RP' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)
