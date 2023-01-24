▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
 #Author: Aniol0012
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

Script creado por Aniol0012

Opciones:

	- Si quieres cambiar el tiempo de ahogar-se puedes hacerlo en: client.lua/L.81. Está puesto en 10 segundos, pero si quieres más puedes cambiarlo.

	- Si quieres cambiar el tiempo en que se baja el hambre y la comida lo puedes hacer en: esx_basicneeds/client/main.lua/L.48 en adelante.
	
	- Si quieres añadir eventos en el que se suba el stress, lo puedes hacer en: esx_basicneeds/client/main.lua/L.191 en adelante. Los eventos los puedes sacar de: https://runtime.fivem.net/doc/natives/?_0x9DE327631295B4C2


Código requerido: 

     if Evento(ped) then
       TriggerEvent('esx_status:add', 'stress', 5000) -- Máximo de puntos para que se llene: 750000
	 end
	 
	 
Ejemplo:

     if IsPedSwimming(ped) then
       TriggerEvent('esx_status:add', 'stress', 5000) -- Cuando nadas añade 2 puntos
	 end