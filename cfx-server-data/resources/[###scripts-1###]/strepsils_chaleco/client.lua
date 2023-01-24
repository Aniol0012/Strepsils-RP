RegisterNetEvent('esx_kamizelka:zakladanie')
AddEventHandler('esx_kamizelka:zakladanie', function()
local ped = GetPlayerPed(-1)
Citizen.Wait(100)
ClearPedTasks(ped)
SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
loadAnimDict( "amb@world_human_cop_idles@male@base" )
TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
Citizen.Wait(700)
SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 3, 2) ---No. 3 es responsable del color del chaleco, p. 1 = negro, 0 = gris etc.
ClearPedTasks(ped)
SetPedArmour(PlayerPedId(), 100) -- El 100 dice cuanta armadura te da
-- SetPedHelmet(PlayerPedId(), 1) -- Test
end)

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end