## esx_billing

Script modificado por Aniol0012 para la comunidad de StrepsilsRP.

NO se permite vender, regalar o dar este script o cualquier otro sin la aprovación mía.

Cualquier uso de este script será fraudulento a no ser que cuente con mi aprovación.


Todas las referencias que se pueden usar para este script, són las siguientes:

	- Fivem Natvies: https://runtime.fivem.net/doc/natives/?n_CFX
	
	- HTML colors: https://htmlcolorcodes.com/
	
	- HTML colors names: https://www.w3schools.com/colors/colors_names.asp
	
	- Fivem Controls: https://docs.fivem.net/docs/game-references/controls/#controls
	
	- Documentación de github de es_estended/esx: No disponible por el momento.
	

# USO

```lua
local amount                         = 100
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

if closestPlayer == -1 or closestDistance > 3.0 then
	ESX.ShowNotification('There\'s no players nearby!')
else
	TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_taxi', 'Taxi', amount)
end
```
	
# Contacto

Para contactarme, puedes hacerlo mediante correo con: aniol0012@gmail.com, o mediante discord: Aniol0012#3498.

# Legal

Copyright (C) 2017-2020 Aniol0012

--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
--
--			  ███████	████████████	████████	███████		████████	███████		████████████	██				███████			  ██████████	████████
--			  ██			 ██			██	  ██	██			██	  ██	██			     ██    		██				██ 				  ██	  ██	██	  ██
--			  ██			 ██			██	  ██	██			██    ██	██			     ██			██				██				  ██	  ██	██	  ██
--			  ███████	 	 ██			████████	███████		████████	███████	         ██ 		██				███████			  ██████████	████████
--				   ██		 ██			██  ██		██			██				 ██	         ██			██					 ██			  ██  ██		██
--				   ██ 		 ██			██  ██		██			██				 ██	         ██ 		██ 				     ██   		  ██  ██		██
--			  ███████		 ██			██	████	███████		██			███████		████████████	███████████		███████			  ██  ██████	██
--																																								By Aniol0012
--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬