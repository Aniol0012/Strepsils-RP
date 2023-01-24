--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE


function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end

-- https://forum.cfx.re/t/release-emojis-for-chat-fivemojis-1-0/150713/18



local Director = {"steam:110000118cf839d","ip:127.0.0.1",}
local Admin = {"steam:","ip:",}
local HighwayPatrol = {"steam:","ip:",}
local Fire = {"steam:","ip:",}
local EMT = {"steam:","ip:",}
local Sheriff = {"steam:","ip:",}
local Moderator = {"steam:","ip:",}
local StateTroopers = {"steam:","ip:",}
-- VIP



-- VIP PLATINO



-- MODERADORES



-- ADMINISTRADORES


-- SUPERADMINISTRADORES


-- FUNDADORES
local Fundador = {"steam:110000117a1e4c9","ip:",} -- Aniol0012



local ScriptCreator = {"steam:110000108ce69e8","ip:",}

---- Ciudadanos


AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
    else     
        local player = GetPlayerIdentifiers(Source)[1]
        if has_value(Director, player) then
            TriggerClientEvent('chatMessage', -1, "Director | " .. Name, { 255, 0, 0 }, Msg)           
        elseif has_value(Admin, player) then
            TriggerClientEvent('chatMessage', -1, "Admin | " .. Name, { 255, 0, 0 }, Msg)
        elseif has_value(HighwayPatrol, player) then
            TriggerClientEvent('chatMessage', -1, "Highway Patrol | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(Fire, player) then
            TriggerClientEvent('chatMessage', -1, "Fire | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(EMT, player) then
            TriggerClientEvent('chatMessage', -1, "EMT | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(Sheriff, player) then
            TriggerClientEvent('chatMessage', -1, "Sheriff's Department | " .. Name, { 0, 0, 255 }, Msg)
	    elseif has_value(Moderator, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 0, 255, 247 }, Msg)
        elseif has_value(Fundador, player) then
            TriggerClientEvent('chatMessage', -1, "⚜️Fundador⚜️ | " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(StateTroopers, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | Admin " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(ScriptCreator, player) then
            TriggerClientEvent('chatMessage', -1, "Chat Roles Creator | " .. Name, { 0, 255, 43 }, Msg)
        else
            TriggerClientEvent('chatMessage', -1, "OOC | " .. Name, { 130, 130, 130 }, Msg)
        end
            
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

---ALLOWS YOU TO CHECK VERSIONS IN GAME

AddEventHandler('chatMessage', function(source, name, msg)
  if msg:sub(1, 1) == "/" then
    sm = stringsplit(msg, " ");
	   if sm[1] == "/fversion" then
		     CancelEvent()
	TriggerClientEvent('chatMessage', source, "^0[^1RolesFX Script Version Check^0]", {30, 144, 255}, " ^2Version 1.1.0 | RolesFX By Aniol0012!^0 ) " .. string.sub(msg,11))
     end
  end

end)

---PRINTS THIS CODE BELOW TO THE CONSOLE 

print('rolesFX ha cargado ^2correctamente ^0en el servidor.')

--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
--- IP'S ARE BROKEN DO NOT USE
