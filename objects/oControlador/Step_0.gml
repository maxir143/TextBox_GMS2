///Custom
if Alarm[0] == (room_speed*TextSpeed) {
	var CopyCharacter = string_char_at(Texto,TextCC)
	if CopyCharacter == "["{
		TextCMD = ""
		for(var i = 1; i < 3 ; i ++){
			var NextChar = string_char_at(Texto,TextCC+i)
			if NextChar == "]"{
				Alarm[1] = real(TextCMD)*room_speed
				TextCC += i + 1
				show_debug_message("esperando :"+TextCMD)
				TBState = "Idle"
				break;
			}
			TextCMD += NextChar
		}
	}else{
		TextoTB += CopyCharacter
		TextCC ++
	}
	
	Alarm[0] = 1
	if TexTL == string_length(TextoTB){	
		TBState = "Idle"
	}
	
}


if TBState == "Reading"{
	Alarm[0] ++
}

if Alarm[1] > 0 {
	if Alarm[1] = 1 {
		TBState = "Reading"
	}
	Alarm[1] --	
}


if keyboard_check_pressed(vk_enter){
	TBState = "Reading"	
}

if keyboard_check_pressed(vk_backspace){
	TBState = "Idle"	
}