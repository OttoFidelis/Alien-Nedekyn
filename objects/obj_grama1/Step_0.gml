/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if place_meeting (x,y,obj_nedekyn) {
	sprite_index=spr_grama1_2
	image_xscale=obj_nedekyn.x_scale
	if image_index>=image_number-1{
		image_index=image_number-1
	}
	if obj_nedekyn.estado=scr_nedekyn_smash{
	instance_destroy()
}
}
else{
	sprite_index=spr_grama1
}

