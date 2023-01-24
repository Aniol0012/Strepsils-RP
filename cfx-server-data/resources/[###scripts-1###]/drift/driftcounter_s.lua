local SaveAtEndOfDrift = GetConvar("DriftC_SaveAtEndOfDrift", "true") -- Set to false if you only want to save every `x` ms
local SaveTime = GetConvar("DriftC_SaveTime", 60000) -- How often you want to save if SaveAtEndOfDrift is false (In ms!)

if SaveAtEndOfDrift == "true" then SaveAtEndOfDrift = true else SaveAtEndOfDrift = false end
local dcname = "Sistema de drift" -- bot's name
local http = "https://discordapp.com/api/webhooks/740946312207269940/zMeXrHn5GJfjz9h2Rh0YZOq0CcLNipXELirub7JQnfAersZuNAsGN-mzVAZt75PdbtyF"   --webhook
local oldscore = 0
local avatar = "" -- bot's avatar

	
	
	
	RegisterNetEvent("SaveScore2")
	AddEventHandler("SaveScore2", function(client, score)

	
	print(score)
	if score > oldscore then

	if oldscore == 0 then
	msg = "El/la jugador/a: "..GetPlayerName(client).. " ha batido el record de score con " ..score
	else
    msg = "El/la jugador/a: "..GetPlayerName(client).. "   se ha convertido en el rey del drift batiendo el anterior record de " ..oldscore.. " con ahora:  "..score

	end

	  DiscordLog("[Rey del drift]", msg, 3066993)
	  oldscore = score
	end

end)


function DiscordLog(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = "Strepsils RP",
            },
        }
    }
        PerformHttpRequest(http, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end
DiscordLog("[Juez]", "¡Records de score reseteados!", 15158332)