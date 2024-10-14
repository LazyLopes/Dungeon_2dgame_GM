switch (state)
{

	case "Padrao":
	#region case padrao
	
		var up = (keyboard_check(vk_up) or keyboard_check(ord("W")))
		var down = (keyboard_check(vk_down) or keyboard_check(ord("S")))
		var left = (keyboard_check(vk_left) or keyboard_check(ord("A")))
		var right = (keyboard_check(vk_right) or keyboard_check(ord("D")))

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
			state = "Attack 1"
		}
		if keyboard_check_pressed(ord("K")){
			image_index = 0
			state = "Attack 2"
		}
		
	#endregion
	break;		
	

	case "Attack 1":
	#region ATTACK1
		if(image_index > 3){
				if(!instance_exists(oHitboxAttc1)){
					instance_create_layer(x + (25 * image_xscale), y+6, layer,oHitboxAttc1)
			} 
		}
		
		sprite_index = sPlayer_atack1;
		if(image_index >= image_number -1){
			if(instance_exists(oHitboxAttc1)) instance_destroy(oHitboxAttc1)
			state = "Padrao"}
	break
	#endregion
	
	
	case "Attack 2":
	#region ATTACK2
		if(image_index > 3){
				if(!instance_exists(oHitboxAttc2)){
					instance_create_layer(x + (25 * image_xscale), y - 1, layer,oHitboxAttc2)
			} 
		}
		
		sprite_index = sPlayer_atack2;
		if(image_index >= image_number -1){
			if(instance_exists(oHitboxAttc2)) instance_destroy(oHitboxAttc2)
			state = "Padrao"}
	break
	#endregion
	
}