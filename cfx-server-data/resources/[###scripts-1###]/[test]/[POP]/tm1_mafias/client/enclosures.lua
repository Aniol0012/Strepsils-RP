local enclosures = {
	[1] = {
		name = "Forum Drive",
		weapon = {x= -135.76, y= -1606.47, z= 35.03},
		garage = {x= -193.4, y= -1582.57, z= 34.75},
		spawnCar = {x= -185.04, y= -1589.6, z= 34.68},
		saveCar = {x= -183.06, y= -1589.97, z= 34.94 },
		attack  = {x= -143.12, y= -1609.22, z= 35.12},
    	vestPoint = {x = -154.62, y = -1603.82, z = 35.04},
		inventoryPoint = {x = -131.32, y = -1606.84, z = 35.03},
		society = "society_mafia1",
		vest = nil,
		owner = nil
	},
	[2] = { 
		name = "Grove Street",
		weapon = {x= 106.05, y= -1978.78, z= 20.96},
		garage = {x= 102.6, y= -1964.61, z= 20.84},
		spawnCar = {x= 102.97, y= -1945.79, z= 20.8},
		saveCar = {x= 107.77, y= -1936.15, z= 20.8 },
		attack = {x= 89.35, y= -1989.96, z= 20.42},
    	vestPoint = {x = 116.94, y = -1961.65, z = 21.33},
		inventoryPoint = {x = 106.36, y = -1981.32, z = 20.96},
		society = "society_mafia2",
		vest = nil,
		owner = nil
	},
	[3] = {
		name = "Sustancia Road",
		weapon = {x= 1435.99, y= -1489.88, z= 66.62},
		garage = {x= 1423.26, y= -1502.69, z= 60.91},
		saveCar = {x= 1408.66, y= -1507.53, z= 59.38},
		spawnCar = {x= 1412.45, y= -1501.08, z= 59.82},
		attack = {x= 1436.78, y= -1483.87, z= 66.74},
    	vestPoint = {x = 1445.24, y = -1485.23, z = 66.62},
		inventoryPoint = {x = 1439.18, y = -1489.63, z = 66.62},
		society = "society_mafia3",
		vest = nil,
		owner = nil
	},
	[4] = {
		name = "Jamestown Street",
		weapon = {x= 338.03, y= -2012.43, z= 22.39},
		garage = {x= 336.71, y= -2028.29, z= 21.65},
		saveCar = {x= 322.44, y= -2037.17, z= 20.62},
		spawnCar = {x= 333.97, y= -2039.11, z= 21.08},
		attack = {x= 366.25, y= -2035.46, z= 25.59},
    	vestPoint = {x = 339.58, y = -2020.76, z = 25.59},
		inventoryPoint = {x = 330.55, y = -2014.53, z = 22.39},
		society = "society_mafia4",
		vest = nil,
		owner = nil
	}
}

local donationsfinish = false

local prices = {
	[1] = 100000,
  	[2] = 30000,
	[3] = 25000,
	[4] = 15000,
	[5] = 13000,
	[6] = 10000,
  	[7] = 8000,
	[8] = 5000,
	[9] = 1500,
	[10] = 1000,
	[11] = 900,
	[12] = 500,
	[13] = 100,
	[14] = 10,
	[15] = 5
}

if donationsfinish == true then
	for i,c in pairs(prices) do
		TriggerServerEvent("tm1_mafias:print",c)
		c = c * 0.5
	end
end
function getShop()
	local shop = {
		{label = "Francotirador - "..prices[2].."$", value = "WEAPON_SNIPERRIFLE", money = prices[2],whatItIs = "weapon"},
		{label = "Subfusil - "..prices[4].."$", value = "WEAPON_MINISMG", money = prices[4],whatItIs = "weapon"},
		{label = "Fusil Compacto - "..prices[3].."$", value = "WEAPON_COMPACTRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Fusil - "..prices[3].."$", value = "WEAPON_ASSAULTRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Rifle Avanzado - "..prices[3].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[3],whatItIs = "weapon"},
		{label = "Pistola de combate - "..prices[7].."$", value = "WEAPON_COMBATPISTOL", money = prices[7],whatItIs = "weapon"},
		{label = "Pistola vintage - "..prices[8].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[8],whatItIs = "weapon"},
		{label = "Tec 9 - "..prices[6].."$", value="WEAPON_MACHINEPISTOL", money = prices[6], whatItIs = "weapon"},
		{label = "Molotov - "..prices[8].."$", value="WEAPON_MOLOTOV", money = prices[8], whatItIs = "weapon"},
		{label = "C4 - "..prices[1].."$", value="WEAPON_STICKYBOMB", money = prices[1], whatItIs = "weapon"},
		{label = "Navaja - "..prices[8].."$", value="WEAPON_SWITCHBLADE",money = prices[8], whatItIs = "weapon"},
		{label = "Daga - "..prices[9].."$", value="WEAPON_DAGGER",money = prices[9], whatItIs = "weapon"},
		{label = "Botella - "..prices[9].."$", value="WEAPON_BOTTLE",money = prices[9], whatItIs = "weapon"},
		{label = "Palanca - "..prices[9].."$", value="WEAPON_CROWBAR",money = prices[9], whatItIs = "weapon"},
		{label = "Stick de Golf - "..prices[9].."$", value="WEAPON_GOLFCLUB",money = prices[9], whatItIs = "weapon"},
		{label = "Martillo - "..prices[9].."$", value="WEAPON_HAMMER",money = prices[9], whatItIs = "weapon"},
		{label = "Puño Americano - "..prices[9].."$", value="WEAPON_KNUCKLE",money = prices[9], whatItIs = "weapon"},
		{label = "Cuchillo - "..prices[9].."$", value="WEAPON_KNIFE",money = prices[9], whatItIs = "weapon"},
		{label = "Machete - "..prices[9].."$", value="WEAPON_MACHETE",money = prices[9], whatItIs = "weapon"},
		{label = "Llave Inglesa - "..prices[9].."$", value="WEAPON_WRENCH",money = prices[9], whatItIs = "weapon"},
		{label = "Taco de Billar - "..prices[9].."$", value="WEAPON_POOLCUE",money = prices[9], whatItIs = "weapon"},
		{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
		{label = "Esposas - "..prices[12].."$", value = "grilletes", money = prices[12],whatItIs = "item"},
		{label = "Llaves de esposas - "..prices[13].."$", value = "keys", money = prices[13],whatItIs = "item"},
		{label = "Paracaidas - "..prices[10].."$", value = "GADGET_PARACHUTE", money = prices[10],whatItIs = "weapon"},
		{label = "Pan - "..prices[14].."$", value = "bread", money = prices[14],whatItIs = "item"},
		{label = "Agua - "..prices[15].."$", value = "water", money = prices[15],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
	}
	--[[if WEAPONLEVEL == 0 then
		shop = {
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 1 then
		shop = {
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 2 then
		shop = {
			{label = "Subfusil - "..prices[2].."$", value = "WEAPON_SMG", money = prices[2],whatItIs = "weapon"},
			{label = "Rifle Avanzado - "..prices[13].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[13],whatItIs = "weapon"},
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 3 then
		shop = {
			{label = "Francotirador - "..prices[1].."$", value = "WEAPON_SNIPERRIFLE", money = prices[1],whatItIs = "weapon"},
			{label = "Subfusil - "..prices[2].."$", value = "WEAPON_SMG", money = prices[2],whatItIs = "weapon"},
			{label = "AK47 - "..prices[3].."$", value = "WEAPON_ASSAULTRIFLE", money = prices[3],whatItIs = "weapon"},
			{label = "Rifle Avanzado - "..prices[13].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[13],whatItIs = "weapon"},
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	end]]
	return shop
end

local state = true
local seconds = 0
local isStarted = 0
local isIn = false
local isPosible = true
--===========
-- BLIPS
--===========
--[[
Citizen.CreateThread(function()
	for _, info in pairs(enclosures) do
      info.blip = AddBlipForCoord(info.attack.x, info.attack.y, info.attack.z)
      SetBlipSprite(info.blip, 374)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, 47)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)
]]--

--===========
-- RECUPERAR DATOS SOBRE RECINTOS
--===========
AddEventHandler('playerSpawned', function(spawn)
	local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
	TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
end)
local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)

RegisterNetEvent('tm1_mafias:puttedGroupsInEnclosures')
AddEventHandler('tm1_mafias:puttedGroupsInEnclosures',function()
	Citizen.CreateThread(function()
		local enclosuresa = {}
		for _, info in pairs(enclosures) do
	      	enclosuresa[_] = info.name      	
	    end
	    TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
	end)
end)

--===========
-- AÑADIENDO DATOS A EL ENCLOUSERS
--===========
RegisterNetEvent('tm1_mafias:putGroupsInEnclosures')
AddEventHandler('tm1_mafias:putGroupsInEnclosures',function(enclosuresInfo)
	for i,v in pairs(enclosuresInfo) do
		for a,b in pairs(enclosures) do
			if v.name == b.name then
				b.owner = v.groupid
			end
		end
	end
	if isStarted == 1 then

	else
		varReady()
		isStarted = 1
	end
	
end)

RegisterNetEvent('tm1_mafias:changeIsPosible')
AddEventHandler('tm1_mafias:changeIsPosible',function(isPosiblea)
	isPosible = isPosiblea
end)

RegisterNetEvent('tm1_mafias:activeAttack')
AddEventHandler('tm1_mafias:activeAttack',function(x1,x2,x3,name,gr,gr1,groupToGroup)
	if groupToGroup then
		backOperation(5,"attackWithIn1",name,x1,x2,x3,gr,gr1)
	else
		backOperation(5,"attackWithIn",name,x1,x2,x3,gr,gr1)
	end
	TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
	TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
	state = false
end)
--===========
-- BORRAR VEHÍCULO
--===========
RegisterNetEvent('tm1_mafias:clearV')
AddEventHandler('tm1_mafias:clearV',function(x,y,z)
	local vehicleu = GetClosestVehicle(x,y,z, 6.5, 0, 70)
	SetEntityAsMissionEntity( vehicleu, true, true )
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicleu ) )
end)

--===========
-- HILO PRINCIPAL
--===========
function varReady()
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(0)
			local coords = GetEntityCoords(GetPlayerPed(-1))
			if not(group.enclosure == nil) then
				for i,v in pairs(enclosures) do
					if v.name == group.enclosure then
						DrawMarker(1,v.garage.x,v.garage.y,v.garage.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.spawnCar.x,v.spawnCar.y,v.spawnCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.saveCar.x,v.saveCar.y,v.saveCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.weapon.x,v.weapon.y,v.weapon.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.vestPoint.x,v.vestPoint.y,v.vestPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(1,v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.garage.x,v.garage.y,v.garage.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL GARAJE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								local coords = {x = v.spawnCar.x,y = v.spawnCar.y,z = v.spawnCar.z}
								local coords1 = {x = v.saveCar.x,y = v.saveCar.y,z = v.saveCar.z}
								TriggerEvent('esx_esx_eden_garage1:activemenu',1,coords,coords1)
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.spawnCar.x,v.spawnCar.y,v.spawnCar.z, true) < 1.5 then
							drawTxt("EN ESTE SITIO EL MAYORDOMO TE TRAERA EL COCHE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.vestPoint.x,v.vestPoint.y,v.vestPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA PONERTE TU CHALECO DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if v.vest then
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
											if skin.sex == 0 then
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.male['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.male['bproof_2'])
											else
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.female['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.female['bproof_2'])
											end
											end)
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 5000)
								else
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 50000)
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL INVENTARIO DE LA MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_inventory', {
									title    = "Inventario de mafia",
									align    = 'top-left',
									elements = {
										{label = "Depositar objetos",    value = 'deposit'},
										{label = "Retirar objetos", value = 'withdraw'}
								}}, function(data, menu)
									if data.current.value == 'deposit' then
										OpenPutStocksMenu(v)
									elseif data.current.value == 'withdraw' then
										OpenGetStocksMenu(v)
									end
								end, function(data, menu)
									menu.close()
								end)
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.saveCar.x,v.saveCar.y,v.saveCar.z, true) < 1.5 then
							drawTxt("PON EL COCHE AQUÍ Y AVISA AL MAYORDOMO QUE LO RECOJA EN EL MÚSCULO E",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
									StockVehicleMenuc()
								else
									TriggerEvent('esx:showNotification', "No hay ningun coche para meter")
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.weapon.x,v.weapon.y,v.weapon.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL MENÚ DE COMPRAS DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								OpenShopMenub()
							end
						end
					else
						DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
							if state then
								drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if v.owner == nil then
									if IsControlJustReleased(0, 38) then
										if isPosible then
											backOperation(15,"attackWithout1",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								else
									if IsControlJustReleased(0, 38) then
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid,true)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							else
								drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							end
						end
					end
				end
			else
				if group.aprove == 2 then
					for i,v in pairs(enclosures) do
						DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if state then
							if GetDistanceBetweenCoords(coords, v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
								drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if IsControlJustReleased(0, 38) then
									if v.owner == nil then
										if isPosible then
											backOperation(15,"attackWithout",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									else
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							end
						else
							drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						end
					end
				end
			end
		end
	end)
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function backOperation(s,operation,encl,x,y,z,gr,gr1)
	Citizen.CreateThread(function ()
	seconds = s
	while true do
		Citizen.Wait(1000)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z, true) < 15 then
			isIn = true
		else
			isIn = false
		end
		if isIn == false then
			TriggerServerEvent('tm1_mafias:advert',"Se ha suspendido el ataque por alejarte demasiado")
			state = 1
			break
		end
		if IsEntityDead(GetPlayerPed(-1)) then
			TriggerServerEvent('tm1_mafias:advert',"Ataque suspendido.")
			state = 1
			break
		end
		if seconds == 0 then
			if operation == "attackWithout" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithout1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			end
			break
		else
			seconds = seconds - 1
		end
	end
	end)
end

function OpenShopMenub()

	local elements = getShop()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = "Tienda de Mafia",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.whatItIs == "weapon" then
				TriggerServerEvent('tm1_mafias:buyWeapon',data.current.value,data.current.money)
			elseif data.current.whatItIs == "item" then
				TriggerServerEvent('esx_shop:comprarItemPop',data.current.value,1,data.current.money)
			elseif data.current.whatItIs == "exit" then
				menu.close()
			end
			
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end 

RegisterNetEvent('tm1_mafias:esposar')
AddEventHandler('tm1_mafias:esposar',function(option)
	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then	
		TriggerServerEvent('tm1_mafias:toClientEsposar',GetPlayerServerId(player),option)
	end
end)

RegisterNetEvent('tm1_mafias:changeEsposar')
AddEventHandler('tm1_mafias:changeEsposar',function(option)
  IsHandcuffed    = option
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed == true then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    elseif IsHandcuffed == false then

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

function OpenPutStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = "Cantidad"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification("Cantidad invalida")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('tm1_mafias:putStockItems', itemName, count, enclosure.society)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getMafiasInventory', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario de la mafia",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title ="Cantidad"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification("Cantidad inválida")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('tm1_mafias:getStockItem', itemName, count, enclosure.society)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, enclosure.society)
end


function StockVehicleMenuc()
		local playerPed  = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(playerPed) then
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			SetEntityAsMissionEntity( vehicle, true, true )
			local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
			local current 	    = GetPlayersLastVehicle(GetPlayerPed(-1), true)
			local engineHealth  = GetVehicleEngineHealth(current)

			ESX.TriggerServerCallback('esx_eden_garage1:stockv',function(valid)

			if (valid) then
				TriggerServerEvent('esx_eden_garage1:debug', vehicle)
				TriggerServerEvent('esx_eden_garage1:modifystate', true, vehicleProps.plate)
				deleteCar( vehicle )
					------------------------------------------------------- sauvegarde de l'etat du vehicule
				TriggerServerEvent('esx_eden_garage1:logging', "engineHealth \t" .. engineHealth.. "\n")
					
				
			if engineHealth < 990 then
				if engineHealth < 960  then
					if engineHealth < 930 then
						if engineHealth < 900 then
							if engineHealth < 870 then
								if engineHealth < 840 then
									if engineHealth < 800 then
										TriggerServerEvent('esx_eden_garage1:payhealth', 2000)
										TriggerServerEvent('esx_eden_garage1:logging', "$2000 has pagado \n")
									else
										TriggerServerEvent('esx_eden_garage1:payhealth', 1800)
										TriggerServerEvent('esx_eden_garage1:logging', "$1800 has pagado \n")
									end
								else 
									TriggerServerEvent('esx_eden_garage1:payhealth', 1700)
									TriggerServerEvent('esx_eden_garage1:logging', "$1700 has pagado \n")
								end
							else 
								TriggerServerEvent('esx_eden_garage1:payhealth', 1600)
								TriggerServerEvent('esx_eden_garage1:logging', "$1600 has pagado \n")
							end
						else 
							TriggerServerEvent('esx_eden_garage1:payhealth', 1500)
							TriggerServerEvent('esx_eden_garage1:logging', "$1500 has pagado \n")
						end
					else 
						TriggerServerEvent('esx_eden_garage1:payhealth', 1000)
						TriggerServerEvent('esx_eden_garage1:logging', "$1000 has pagado \n")
					end
				else
					TriggerServerEvent('esx_eden_garage1:payhealth', 500)
					TriggerServerEvent('esx_eden_garage1:logging', "$500 has pagado \n")
				end
			end
						TriggerEvent('esx:showNotification', 'Su vehículo está en el garaje')
			else
				TriggerEvent('esx:showNotification', 'No puede almacenar este vehículo')
			end
			end,vehicleProps)
		else
			TriggerEvent('esx:showNotification', 'No hay vehículo para meter')
		end
end