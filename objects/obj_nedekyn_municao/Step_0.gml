/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var move = key_right - key_left
var verticalmove=key_down-key_up
var nedekyn=obj_nedekyn

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
if place_meeting(x,y+verticalspd,obj_block){
	while !place_meeting(x,y+sign(verticalspd),obj_block){
		y+=sign(verticalspd)
	}
}
if place_meeting(x,y+sign(verticalspd),obj_block) and verticalspd<0{
	instance_create_layer(x,y,"Particulas",obj_efeito_tiro_impacto)
	instance_destroy()
}
if place_meeting(x+sign(horizontalspd),y,obj_block) and !place_meeting(x,y-1,obj_block){
	instance_create_layer(x,y,"Particulas",obj_efeito_tiro_impacto)
	instance_destroy()
}
if place_meeting(x,y+sign(verticalspd),obj_block) and verticalspd>0{
	instance_create_layer(x,y+12,"Particulas",obj_efeito_tiro_impacto_chao)
	instance_destroy()
}
if obj_nedekyn.estado=scr_nedekyn_livre{
	instance_destroy()
}

x+=horizontalspd
y+=verticalspd




