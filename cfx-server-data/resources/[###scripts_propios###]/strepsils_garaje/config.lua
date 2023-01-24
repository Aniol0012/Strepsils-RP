Config = {}

Config.VehicleMenu = true -- True si quiere un que se habilite un menú de vehículo. Recomendado: true
-- Arriba deshabilitado por DeadlyEmu # 0001 Esta función tiene errores y tengo CBA para solucionarlo. hay mejores recursos que hacen este trabajo
Config.VehicleMenuButton = 318 -- F5 ,Default: F11. Cambie esto a la tecla con la que desea abrir el menú. Botones: https://docs.fivem.net/game-references/controls/
Config.RangeCheck = 25.0 -- Este es el círculo con el que podrá controlar el vehículo.

Config.Impound = true -- True para habilitar el desguace  Recomendado: true
Config.ImpoundPrice = 2000 -- El precio que cuesta recuperar el vehículo.
Config.ImpoundName = "Depósito" -- Nombre del blip del desguace.<
Config.RebootRestore = true -- enviar todos los autos al garaje al reiniciar el recurso?  Recomendado: true
Config.ImpoundAutoBan = true -- Autoban jugador si se descubre exploit? (Intentar poner el coche en en garaje via lua executor) Necesita EasyAdmin
Config.AutoBanMessage = "Has sido permabaneado por hacer trampas. Si ha sido un error, ponte en contacto en discord." -- Ban message to show

Config.LockGarage = false -- True = Cada coche se guarda en el garaje en que estaba (y no se puede sacar en otros). False = Todos los coches se pueden sacar desde tos los garajes.

Config.UseVehicleNamesLua = true
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
-- #Author: Aniol0012
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Config.BlipImpound = {
    Sprite = 467, -- Default: 527
    Color = 60,
    Display = 2,
    Scale = 0.7
}

Config.DrawDistance = 100.0

-- Depósito

Config.CarPounds = {
    Pound_LosSantos = {
        PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
        SpawnPoint = { x = 405.64, y = -1643.4, z = 27.61, h = 229.54 }
    },
    
    Pound_Sandy = {
        PoundPoint = { x = 1651.38, y = 3804.84, z = 37.65 },
        SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
    },
    
    Pound_Paleto = {
        PoundPoint = { x = -215.1, y = 6218.61, z = 30.49 },
        SpawnPoint = { x = -212.66, y = 6211.71, z = 30.49, h = 252.41 }
    }
}

Config.PoundMarker = {
    r = 243, g = 178, b = 68,     -- Naranja
    x = 2.5, y = 2.5, z = 1.0  -- Standard Size Circle
}





--Garages
Config.Garages = {
    ["ciudad"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(211.8094329834, -934.98626708984, 24.275938034058)
            },
            ["vehicle"] = {
                ["position"] = vector3(219.86030578613, -932.77551269531, 24.141599655151), 
                ["heading"] = 140.0
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 224.94281005859, 
            ["y"] = -930.33062744141, 
            ["z"] = 26.571212768555, 
            ["rotationX"] = -31.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -243.40157422423 
        }
    },

    ["zancudo"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-2265.08, 4292.75, 46.3)
            },
            ["vehicle"] = {
                ["position"] = vector3(-2270.29, 4277.67, 45.57), 
                ["heading"] = 230.32
            }
        },
        ["camera"] = { 
            ["x"] = -2264.96, 
            ["y"] = 4281.58, 
            ["z"] = 47.7, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 125.73228356242 
        }
    },

    ["playa"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
                ["heading"] = 320.0
            }
        },
        ["camera"] = { 
            ["x"] = -1813.5513916016, 
            ["y"] = -340.40087890625, 
            ["z"] = 46.962894439697, 
            ["rotationX"] = -39.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -42.110235854983 
        }
    },
    --SANDY
    ["sandy"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1733.94, 3711.99, 34.15)
            },
            ["vehicle"] = {
                ["position"] = vector3(1723.26, 3715.53, 33.76), 
                ["heading"] = 21.41
            }
        },
        ["camera"] = { 
            ["x"] = 1727.8, 
            ["y"] = 3725.44, 
            ["z"] = 38.51, 
            ["rotationX"] = 0.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 162.0
        }
    },
    --Paleto
        
    ["central"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-187.82, 6214.64, 31.75)
            },
            ["vehicle"] = {
                ["position"] = vector3(-199.77, 6214.2, 31.49), 
                ["heading"] = 216.89
            }
        },
        ["camera"] = { 
            ["x"] = -191.08, 
            ["y"] = 6219.08, 
            ["z"] = 35.49, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 125.73228356242 
        }
    },
    --Grapeseed
        
    ["cultivos"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(2567.93, 4652.38, 34.08)
            },
            ["vehicle"] = {
                ["position"] = vector3(2553.09, 4675.0, 33.52), 
                ["heading"] = 10.28
            }
        },
        ["camera"] = { 
            ["x"] = 2558.72, 
            ["y"] = 4680.29, 
            ["z"] = 33.69, 
            ["rotationX"] = 10.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -220.0
        }
    }
}

Config.Labels = {
    ["menu"] = "Pulsa ~INPUT_CONTEXT~ para abrir el garaje %s.",
    ["vehicle"] = "Pulsa ~INPUT_CONTEXT~ para guardar el vehículo." -- Si quieres que se mencione el vehiculo (no recomendado porque hay veces que pone NULL, pon: '%s'ı)
}

Config.Trim = function(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

Config.AlignMenu = "right" -- this is where the menu is located [left, right, center, top-right, top-left etc.]