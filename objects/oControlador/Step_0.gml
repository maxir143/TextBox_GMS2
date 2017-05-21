///Custom Alarm
if Alarm[0] == (room_speed*TextSpeed) {
	//Leer carácter actual
	var CopyCharacter = string_char_at(Texto,TextCC)
	//Si el carácter es '['
	if CopyCharacter == "["{
		//Borrar las String lectora de comandos
		TextCMD = ""
		//Crear un Foor Loop en busca de el carácter de cierre ']'
		for(var i = 1; i < 3 ; i ++){
			////Leer carácter actual
			var NextChar = string_char_at(Texto,TextCC+i)
			//Si el carácter es ']'
			if NextChar == "]"{
				//Si las String lectora de comandos es igual a 0
				if TextCMD == 0 {
					//La State machine se quedara estatica indefinidamente
					TBState = "Idle"
					show_debug_message("esperando : Indefinidamente")
					//terminara el proceso
					break;
				}
				//en caso de continuar
				//activamos la segunda alarma personalizada
				Alarm[1] = real(TextCMD)*room_speed
				//recorremos la posicion del carácter actual
				TextCC += i + 1
				show_debug_message("esperando :"+TextCMD)
				//La State machine se quedara estatica indefinidamente
				TBState = "Idle"
				//terminara el proceso
				break;
			}
			//agregar NextChar a String lectora de comandos
			TextCMD += NextChar
		}
	}else{
		//string para DrawEvent
		TextoTB += CopyCharacter
		//recorremos la posicion del carácter actual
		TextCC ++
	}
	//reiniciar alarma personalizada 
	Alarm[0] = 1
	//si la string para DrawEvent es igual a Largo del Texto Original
	if TexTL == string_length(TextoTB){
		//La State machine se quedara estatica indefinidamente	
		TBState = "Idle"
	}
	
}

//State Machine readign 
if TBState == "Reading"{
	Alarm[0] ++
}

//Alarma personalizada 2 >> es la que espera basada en comandos 
if Alarm[1] > 0 {
	if Alarm[1] = 1 {
		TBState = "Reading"
	}
	Alarm[1] --	
}

//teclas para controlar la State machine
if keyboard_check_pressed(vk_enter){
	TBState = "Reading"	
}

if keyboard_check_pressed(vk_backspace){
	TBState = "Idle"	
}