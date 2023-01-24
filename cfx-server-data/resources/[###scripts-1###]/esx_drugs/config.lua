Config = {}

Config.Locale = 'es'

Config.Delays = {
	WeedProcessing = 1000 * 10
}

Config.DrugDealerItems = {
	weed = 65
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

--[[Config.Map = {
  {name="Coke Farm",       color=6, scale=0.8, id=403, x=2145.9228515625,  y=4778.8076171875,  z=40.253701019287},
  {name="Coke Treatment",  color=6, scale=0.8, id=403, x=-458.13967895508, y=-2278.6174316406, z=7.5158290863037},
  {name="Coke Sales",      color=6, scale=0.8, id=403, x=-1756.1984863281, y=427.31674194336,  z=126.68292999268},
  {name="Meth Farm",       color=6, scale=0.8, id=403, x=1390.298828125,   y=3605.0217285156,  z=38.00956726074},
  {name="Meth Treatment",  color=6, scale=0.8, id=403, x=-1147.4151611328, y=4940.0087890625,  z=221.00686645508},
  {name="Meth Sales",      color=6, scale=0.8, id=403, x=-63.592178344727, y=-1224.0709228516, z=27.768648147583},
  {name="Opium Farm",      color=6, scale=0.8, id=403, x=1541.784790039,   y=6335.3999023438,  z=23.028722381592},
  {name="Opium Treatment", color=6, scale=0.8, id=403, x=-7.26499023438,   y=519.51328125,     z=173.575107192994},
  {name="Opium Sales",     color=6, scale=0.8, id=403, x=2331.0881347656,  y=2570.2250976562,  z=46.681819915772},
  {name="Weed Farm",       color=2, scale=0.8, id=140, x=2217.125,         y=5577.5942382813,  z=52.961572647095},
  {name="Weed Treatment",  color=2, scale=0.8, id=140, x=29.061386108398,  y=3666.0380859375,  z=39.77326965332},
  {name="Weed Sales",      color=2, scale=0.8, id=140, x=-54.249694824219, y=-1443.3666992188, z=31.068626403809}
}]]

Config.CircleZones = {
	WeedField = {coords = vector3(2305.51, 5127.89, 50.29), name = _U('blip_weedfield'), color = 0, sprite = 0, radius = 0},
	WeedProcessing = {coords = vector3(1455.4, 6551.34, 14.75), name = _U('blip_weedprocessing'), color = 0, sprite = 0, radius = 0},

	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 0, sprite = 0, radius = 0},
}