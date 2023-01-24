resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "https://cadena100-cope-rrcast.flumotion.com/cope/cadena100.mp3", volume = 0.2, name = "Cadena 100"  }-- Bien
supersede_radio "RADIO_02_POP" { url = "http://192.173.31.51/LOS40_SC", volume = 0.2, name = "Los 40 Principales" }-- Bien
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "https://208.92.53.92/LOS40_CLASSICAAC_SC", volume = 0.2, name = "Los 40 Clasicos"  }-- Bien
supersede_radio "RADIO_07_DANCE_01" { url = "http://kissfm.kissfmradio.cires21.com/kissfm.mp3", volume = 0.2, name = "Kiss FM"  }-- Bien
supersede_radio "RADIO_05_TALK_01" { url = "http://live.flavorfm.com:8352/stream", volume = 0.2, name = "Cadena Ser" }-- Bien
supersede_radio "RADIO_14_DANCE_02" { url = "http://icecast-streaming.nice264.com/europafm", volume = 0.2, name = "Europa FM" }
supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://rockfm-cope-rrcast.flumotion.com/cope/rockfm.mp3", volume = 0.2, name = "Rock FM" }
supersede_radio "RADIO_12_REGGAE" { url = "http://audio-online.net:2300/live", volume = 0.2, name = "Loca FM" }
supersede_radio "RADIO_16_SILVERLAKE" { url = "http://live.flavorfm.com:8327/stream", volume = 0.2, name = "Cadena Dial" }
supersede_radio "RADIO_13_JAZZ" { url = "http://icecast-streaming.nice264.com/melodiafmback", volume = 0.2, name = "Melodia FM" }

--[[
    "RADIO_01_CLASS_ROCK",  // Los Santos Rock Radio
    "RADIO_02_POP",         // Non-Stop-Pop FM
    "RADIO_03_HIPHOP_NEW",  // Radio Los Santos
    "RADIO_04_PUNK",        // Channel X
    "RADIO_05_TALK_01",     // West Coast Talk Radio
    "RADIO_06_COUNTRY",     // Rebel Radio -- Al lado del inicio. Dejar esta.
    "RADIO_07_DANCE_01",    // Soulwax FM
    "RADIO_08_MEXICAN",     // East Los FM
    "RADIO_09_HIPHOP_OLD",  // West Coast Classics
    "RADIO_12_REGGAE",      // Blue Ark
    "RADIO_13_JAZZ",        // Worldwide FM
    "RADIO_14_DANCE_02",    // FlyLo FM
    "RADIO_15_MOTOWN",      // The Lowdown 91.1
    "RADIO_20_THELAB",      // The Lab
    "RADIO_16_SILVERLAKE",  // Radio Mirror Park
    "RADIO_17_FUNK",        // Space 103.2
    "RADIO_18_90S_ROCK",    // Vinewood Boulevard Radio
    "RADIO_19_USER",        // Self Radio
    "RADIO_11_TALK_02"      // Blaine County Radio
	
	https://emisora.org.es/#onda-cero
	
Cadena 100
Los 40 Principales
Los 40 Clasicos
Kiss FM
Cadena Ser
Europa FM
Rock FM
Loca FM
Cadena Dial
Melodia FM

--]]


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
