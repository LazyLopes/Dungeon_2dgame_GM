function PlayerState_Padrao(){
	#region MOVIMENTACAO
		var horizontal = right - left
		var vertical = down - up

		if (horizontal != 0 and vertical != 0){
			vel_h = vel_diagonal * horizontal 
			vel_v = vel_diagonal * vertical 
		} else {
			vel_h = vel_normal * horizontal
			vel_v = vel_normal * vertical 
		}
		#endregion

		#region COLLISAO
		if (place_meeting(x+vel_h, y, oParede_d))
		{	vel_h = 0	}

		if (place_meeting(x+vel_h, y, oParede_e))
		{	vel_h = 0	}

		if (place_meeting(x, y+vel_v, oParede_cima))
		{	vel_v = 0	}

		if (place_meeting(x, y+vel_v, oParede_cima2))
		{	vel_v = 0	}

		if (place_meeting(x, y+vel_v, oParede_b))
		{	vel_v = 0	}
		#endregion
		
		x += vel_h
		y += vel_v
		
		// inverte a imagem quando anda pro outro lado
		if (right){image_xscale = 1}
		if (left){image_xscale = -1}

		// se anda troca para o sprite andando
		if (left or right or up or down){sprite_index=sPlayer_andando}
		else{sprite_index=sPlayer_parado}
		
		if keyboard_check_pressed(ord("J")){
			image_index = 0
			state = PLAYERSTATE.ATTACK1
		}
		if keyboard_check_pressed(ord("K")){
			image_index = 0
			state = PLAYERSTATE.ATTACK2
		}
}