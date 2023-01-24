Config = {
	MenuLanguage         = 'es', -- Cambiar idioma
	
	DebugDisplay         = false, -- Para printear lo que sucede, no lo recomiendo a no ser que haya errores.
	
	EnableXtoCancel      = true, -- Hacer que con la X canceles la animacion.

	DisarmPlayer         = true, -- Poner esto en true si quieres desarmar a alguien cuando hace la animacion.
	
    PermitirCoche        = false, -- True para permitir las animaciones en el coche, false para no.
	
	MenuKeybindEnabled   = true, -- True para que se puede habrir el menu con el Abrir.
	
	Abrir                = 170, -- Default puesto el F3(170). Para cambiarlo puedes hacerlo aquí: https://docs.fivem.net/game-references/controls/ .
	
	Cancelar             = 73, -- Default puesto la X(73). Para cambiarlo puedes hacerlo aquí: https://docs.fivem.net/game-references/controls/ .
	
	CancelarEspacio      = 22, -- Default puesto el espacio (22). Para cambiarlo puedes hacerlo aquí: https://docs.fivem.net/game-references/controls/ .

	FavKeybindEnabled    = true, -- Tecla favorita
	
	FavKeybind           = 171, -- Get the button number here https://docs.fivem.net/game-references/controls/
	
	--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Menú▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

	CustomMenuEnabled    = true, -- La imagen debe ser de 512 x 128
	
	MenuImage            = "https://cdn.discordapp.com/attachments/734359421429219358/734359464509177968/kgzvDwQ.png",

	MenuPosition         = "right", -- (left, right)
	
	ExpressionsEnabled   = true, -- Que se muestren las expresiones en el menú.
	
	WalkingStylesEnabled = true, -- Que se muestren las formas de andar en el menú.
	
	SharedEmotesEnabled  = true, -- Que se guarden los emotes configurados de las teclas en la base de datos.
	
	SqlKeybinding        = true, -- Que se guarden las teclas en la base de datos.
	
	CheckForUpdates      = false, -- Revisar las actualizaciones.
	
	--▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬Animaciones▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

	SueloOn              = true, -- True = Activar, False = Desactivar, el /suelo y el + para estirarse.
	
	Suelo                = 314,  -- El + del numpad [314]
	
	AgacharseOn          = true, -- True = Activar, False = Desactivar, el agacharse.
	
	Agacharse            = 36,   -- Control de la izquierda [36]
	
	CruzarOn             = true, -- True = Activar, False = Desactivar, el cruzar los brazos.
	
	Cruzarbrazos 	  	 = 47,   -- En la G [47]
	
	LevantarOn           = true, -- True = Activar, False = Desactivar, el levantar las manos.
	
	Levantarlasmanos 	 = 20,   -- En la Z [20]
	
	SenalarOn            = true, -- True = Activar, False = Desactivar, el señalar con el dedo.
	
	Senalar 		     = 29,   -- B [29]
	
	CerrarCocheOn        = false, -- True = Activar, False = Desactivar, el cerrar el coche.
	
	CerrarCoche 		 = 303,   -- U [303]
	
	FacepalmOn           = true, -- True = Activar, False = Desactivar, el facepalm.
	
	Facepalm    		 = 74,   -- H [74]
	
	EsperandoOn          = true, --True = Activar, False = Desactivar, el esperando.
	
	Esperando 		     = 182,   -- L [182]
	
	ArrestadoOn          = true, --True = Activar, False = Desactivar, el arrestado.
	
	Arrestado   		 = 311,   -- K [311]
	
	SentadoOn            = true, --True = Activar, False = Desactivar, el .
	
	Sentado 		     = 38,   -- E [38]

	Sentado2 		     = 155,   -- SHIFT [155]
	

	-- Controles: https://docs.fivem.net/game-references/controls/
}

Config.KeybindKeys = {
    ['num4'] = 108,
    ['num5'] = 110,
    ['num6'] = 109,
    ['num7'] = 117,
    ['num8'] = 111,
    ['num9'] = 118
}

Config.Languages = {
  ['en'] = {
        ['emotes'] = 'Emotes',
        ['danceemotes'] = "🕺 Dance Emotes",
        ['propemotes'] = "📦 Prop Emotes",
        ['favoriteemotes'] = "🌟 Favorite",
        ['favoriteinfo'] = "Select an emote here to set it as your favorite.",
        ['rfavorite'] = "Reset favorite",
        ['prop2info'] = "❓ Prop Emotes can be located at the end",
        ['set'] = "Set (",
        ['setboundemote'] = ") to be your bound emote?",
        ['newsetemote'] = "~w~ is now your bound emote, press ~g~CapsLock~w~ to use it.",
        ['cancelemote'] = "Cancel Emote",
        ['cancelemoteinfo'] = "~r~X~w~ Cancels the currently playing emote",
        ['walkingstyles'] = "Walking Styles",
        ['resetdef'] = "Reset to default",
        ['normalreset'] = "Normal (Reset)",
        ['moods'] = "Moods",
        ['infoupdate'] = "Information",
        ['infoupdateav'] = "Information (Update available)",
        ['infoupdateavtext'] = "An update is available, get the latest version from ~y~https://github.com/andristum/dpemotes~w~",
        ['suggestions'] = "Suggestions?",
        ['suggestionsinfo'] = "'dullpear_dev' on FiveM forums for any feature/emote suggestions! ✉️",
        ['notvaliddance'] = "is not a valid dance.",
        ['notvalidemote'] = "is not a valid emote.",
        ['nocancel'] = "No emote to cancel.",
        ['maleonly'] = "This emote is male only, sorry!",
        ['emotemenucmd'] = "Do /emotemenu for a menu.",
        ['shareemotes'] = "👫 Shared Emotes",
        ['shareemotesinfo'] = "Invite a nearby person to emote",
        ['sharedanceemotes'] = "🕺 Shared Dances",
        ['notvalidsharedemote'] = "is not a valid shared emote.",
        ['sentrequestto'] = "Sent request to ~y~",
        ['nobodyclose'] = "Nobody ~r~close~w~ enough.",
        ['doyouwanna'] = "~y~Y~w~ to accept, ~r~L~w~ to refuse (~g~",
        ['refuseemote'] = "Emote refused.",
        ['makenearby'] = "makes the nearby player play",
        ['camera'] = "Press ~y~G~w~ to use camera flash.",
        ['makeitrain'] = "Press ~y~G~w~ to make it rain.",
        ['pee'] = "Hold ~y~G~w~ to pee.",
        ['spraychamp'] = "Hold ~y~G~w~ to spray champagne",
        ['bound'] = "Bound ",
        ['to'] = "to",
        ['currentlyboundemotes'] = " Currently bound emotes:",
        ['notvalidkey'] = "is not a valid key.",
        ['keybinds'] = "🔢 Keybinds",
        ['keybindsinfo'] = "Use"
  },
  ['es'] = {
        ['emotes'] = "Animaciones",
        ['danceemotes'] = "🕺 Bailes",
        ['propemotes'] = "📦 Objetos",
        ['keybindemotes'] = "🌟 Favorita",
        ['keybindinfo'] = "Selecciona una animacion como su favorita.",
        ['rkeybind'] = "Reiniciar favorito",
        ['prop2info'] = "❓ Animaciones de objetos al final.",
        ['set'] = "Elegir (",
        ['setboundemote'] = ") como tu animacion favorita?",
        ['newsetemote'] = "~w~ es ahora tu animacion favorita, pulsa ~g~[CapsLock]~w~ para usarla.",
        ['cancelemote'] = "Cancelar animacion",
        ['cancelemoteinfo'] = "~r~X~w~ Cancela la animacion actual.",
        ['walkingstyles'] = "Formas de caminar",
        ['resetdef'] = "Reiniciar a por defecto",
        ['normalreset'] = "Normal (Reiniciar)",
        ['moods'] = "Estados de animo",
        ['infoupdate'] = "Informacion",
        ['infoupdateav'] = "Informacion (Actualizacion disponible)",
        ['infoupdateavtext'] = "Una actualizacion esta disponible, para conseguir la ultima version ingresa a ~y~https://github.com/andristum/dpemotes~w~",
        ['suggestions'] = "Sugerencias?",
        ['suggestionsinfo'] = "dullpear_dev' en el foro de FiveM para cualquier sugerencia! ✉️",
        ['notvaliddance'] = "no es un baile valido.",
        ['notvalidemote'] = "no es una animacion valida.",
        ['nocancel'] = "No hay animacion para cancelar.",
        ['maleonly'] = "Esta animacion es solo de hombre!",
        ['emotemenucmd'] = "Escribe /emotemenu para abrir el menu.",
        ['shareemotes'] = "👫 Animaciones compartidas",
        ['shareemotesinfo'] = "Invita a una persona cercana para la animacion.",
        ['sharedanceemotes'] = "🕺 Bailes compartidos",
        ['notvalidsharedemote'] = "no es una animacion compartida valida.",
        ['sentrequestto'] = "Solicitud enviada ~y~",
        ['nobodyclose'] = "No hay nadie ~r~cerca~w~.",
        ['doyouwanna'] = "~y~Y~w~ para aceptar, ~r~L~w~ para rechazar (~g~",
        ['refuseemote'] = "Animacion rechazada.",
        ['makenearby'] = "hacer que el jugador cercano juegue",
        ['camera'] = "Pulsa ~y~E~w~ para usar el flash de la camara.",
        ['makeitrain'] = "Pulsa ~y~E~w~ para hacer llover.",
        ['pee'] = "Pulsa ~y~E~w~ para mear.",
        ['spraychamp'] = "Pulsa ~y~E~w~ rociar champán.",
        ['bound'] = "Unida ",
        ['to'] = "a",
        ['currentlyboundemotes'] = " Emotes vinculados actualmente:",
        ['notvalidkey'] = "no es una tecla válida.",
        ['keybinds'] = "🔢 Teclas",
        ['keybindsinfo'] = "Utilizar"
  }
}