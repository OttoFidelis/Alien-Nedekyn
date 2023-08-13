/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
if obj_nedekyn.x_scale=-1 and !key_left{
	if key_right{
		instance_destroy()
	}
}
if obj_nedekyn.x_scale=1 and !key_right{
	if key_left{
		instance_destroy()
	}
}

if place_meeting(x+horizontalspd,y,obj_block){
	while !place_meeting(x+sign(horizontalspd),y,obj_block){
		x+=sign(horizontalspd)
	}
	
}

if place_meeting(x+sign(horizontalspd),y,obj_block){
	instance_create_layer(x,y+10,"frente",obj_efeito_tiro_impacto)
	instance_destroy()
}
if obj_nedekyn.estado=scr_nedekyn_livre{
	instance_destroy()
}

x+=horizontalspd
y+=verticalspd




