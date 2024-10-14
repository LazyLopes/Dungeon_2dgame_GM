function PlayerState_Attack1(){
	if(image_index > 3){
			if(!instance_exists(oHitboxAttc1)){
				instance_create_layer(x + (25 * image_xscale), y+6, layer,oHitboxAttc1)
		} 
	}
		
	sprite_index = sPlayer_atack1;
	if(image_index >= image_number -1){
		if(instance_exists(oHitboxAttc1)) instance_destroy(oHitboxAttc1)
		state = PLAYERSTATE.PADRAO}
}