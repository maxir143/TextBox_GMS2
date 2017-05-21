//Alarmas personalizadas 
Alarm[0] = 0
Alarm[1] = 0


TextSpeed = .3 // .1 >> 1 - letras por segundo

//strign a escribir >> [segundo a esperar] || 0 = esperar indefinidamente
Texto = "Hola [3]Mundo![2] Waiting [2]Time" 

//string para DrawEvent
TextoTB = ""

//Largo del Texto Original
TexTL = string_length(Texto) 

//Posicion del carácter actual
TextCC = 1 

//State Machine
TBState = "Idle"

//String lectora de comandos
TextCMD = ""