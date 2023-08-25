/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var move = key_right - key_left
var verticalmove=key_down-key_up
var nedekyn=obj_nedekyn

if key_right and nedekyn.gun=nedekyn.gunmax{
	state=0
	if state!=0 instance_destroy()
	horizontalspd=horizontalmaxspd
	}
	if key_left and nedekyn.gun=nedekyn.gunmax{
	state=1
	if state!=1 instance_destroy()
	horizontalspd=horizontalmaxspd*-1
	}
if move=0 and nedekyn.gun=nedekyn.gunmax { 
	state=2
	if state!=2 instance_destroy()
	horizontalspd=horizontalmaxspd*obj_nedekyn.x_scale
	}
if key_up and move!=0 and nedekyn.gun=nedekyn.gunmax{ 
	state=3
	if state!=3 instance_destroy()
	verticalspd=verticalmaxspd*-1
	}
	if key_up and move=0 and nedekyn.gun=nedekyn.gunmax {
		state=4
		if state!=4 instance_destroy()
		verticalspd=verticalmaxspd*-1 
		horizontalspd=0
	}
if key_down and move!=0 and nedekyn.gun=nedekyn.gunmax{ 
	state=5]~~ç´´´´´´´´´´´´
	if state!=5 instance_destroy()
	verticalspd=verticalmaxspd
	
	}







