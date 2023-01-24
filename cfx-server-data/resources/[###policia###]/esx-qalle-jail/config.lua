Config = {}

Config.JailPositions = {
	["Cell"] = { ["x"] = 1708.99, ["y"] = 2568.233, ["z"] = 50.1900, ["h"] = 179.03021240234 }
}

Config.Cutscene = {
	["PhotoPosition"] = { ["x"] = 402.91567993164, ["y"] = -996.75970458984, ["z"] = -99.000259399414, ["h"] = 186.22499084473 },

	["CameraPos"] = { ["x"] = 402.88830566406, ["y"] = -1003.8851318359, ["z"] = -97.419647216797, ["rotationX"] = -15.433070763946, ["rotationY"] = 0.0, ["rotationZ"] = -0.31496068835258, ["cameraId"] = 0 },

	["PolicePosition"] = { ["x"] = 402.91702270508, ["y"] = -1000.6376953125, ["z"] = -99.004028320313, ["h"] = 356.88052368164 }
}

Config.PrisonWork = {
	["DeliverPackage"] = { ["x"] = 1027.2347412109, ["y"] = -3101.419921875, ["z"] = -38.999870300293, ["h"] = 267.89135742188 },

	["Packages"] = {
		[1] = { ["x"] = 1003.6661987305, ["y"] = -3108.4221191406, ["z"] = -38.999866485596, ["state"] = true },
		[2] = { ["x"] = 1006.0420532227, ["y"] = -3103.0024414063, ["z"] = -38.999866485596, ["state"] = true },
		[3] = { ["x"] = 1015.7958374023, ["y"] = -3102.8337402344, ["z"] = -38.99991607666, ["state"] = true },
		[4] = { ["x"] = 1012.8907470703, ["y"] = -3108.2907714844, ["z"] = -38.999912261963, ["state"] = true },
		[5] = { ["x"] = 1018.2017822266, ["y"] = -3109.1982421875, ["z"] = -38.999897003174, ["state"] = true },
		[6] = { ["x"] = 1018.0194091797, ["y"] = -3096.5700683594, ["z"] = -38.999897003174, ["state"] = true },
		[7] = { ["x"] = 1015.6422119141, ["y"] = -3091.7392578125, ["z"] = -38.999897003174, ["state"] = true },
		[8] = { ["x"] = 1010.7862548828, ["y"] = -3096.6135253906, ["z"] = -38.999897003174, ["state"] = true },
		[9] = { ["x"] = 1005.7819824219, ["y"] = -3096.8415527344, ["z"] = -38.999897003174, ["state"] = true },
		[10] = { ["x"] = 1003.4543457031, ["y"] = -3096.7048339844, ["z"] = -38.999897003174, ["state"] = true }
	}
}

Config.Teleports = {
	["Prison Work"] = { 
		["x"] = 992.51770019531, 
		["y"] = -3097.8413085938, 
		["z"] = -38.995861053467, 
		["h"] = 81.15771484375, 
		["goal"] = { 
			"Jail" 
		} 
	},

	["Boiling Broke"] = { 
		["x"] = 1845.6022949219, 
		["y"] = 2585.8029785156, 
		["z"] = 45.672061920166, 
		["h"] = 92.469093322754, 
		["goal"] = { 
			"Security" 
		} 
	},

	["Jail"] = { 
		["x"] = 1676.222778, 
		["y"] = 2593.1923, 
		["z"] = 45.585, 
		["h"] = 87.4532, 
		["goal"] = { 
			"Prison Work", 
			"Security", 
			"Visitor" 
		} 
	},

	["Security"] = { 
		["x"] = 1706.7625732422,
		["y"] = 2581.0793457031, 
		["z"] = -69.407371520996, 
		["h"] = 267.72802734375, 
		["goal"] = { 
			"Jail",
			"Boiling Broke"
		} 
	},

	["Visitor"] = {
		["x"] = 1699.7196044922, 
		["y"] = 2574.5314941406, 
		["z"] = -69.403930664063, 
		["h"] = 169.65020751953, 
		["goal"] = { 
			"Jail" 
		} 
	}
}