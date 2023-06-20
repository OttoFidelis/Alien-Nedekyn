/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,obj_block2){
	if direcao = 0{
		direcao = 1
	}
	else if direcao = 1{
		direcao = 0 
	}
}
if direcao = 0{
	x += speedinimigo
	sprite_index = spr_inimigo_generico
	image_xscale = 1
}
else if direcao = 1{
	x -= speedinimigo
	sprite_index = spr_inimigo_generico
	image_xscale = -1
}
if vidainimigo <= 0{
	instance_destroy()
} 
