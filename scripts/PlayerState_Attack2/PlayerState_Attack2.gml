function PlayerState_Attack2(){
	if(image_index > 3){
		
		if(!instance_exists(oHitboxAttc2)){
			instance_create_layer(x + (25 * image_xscale), y - 1, layer,oHitboxAttc2)
		} 
	}
		
	sprite_index = sPlayer_atack2;
	if(image_index >= image_number -1){
		if(instance_exists(oHitboxAttc2)) instance_destroy(oHitboxAttc2)
		state = PLAYERSTATE.PADRAO}
}