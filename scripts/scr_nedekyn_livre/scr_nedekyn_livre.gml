
function scr_nedekyn_livre(){
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_left_pressed = keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))||gamepad_button_check_pressed(0,gp_padl)
var key_right_pressed = keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))||gamepad_button_check_pressed(0,gp_padr)
var key_jump = keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var key_attack = keyboard_check_pressed(ord("V"))||gamepad_button_check_pressed(0,gp_face4)
var key_gun = keyboard_check(ord("B"))||gamepad_button_check(0,gp_shoulderrb)
var key_dodge = keyboard_check_pressed(ord("C"))||gamepad_button_check_pressed(0,gp_shoulderlb)
var key_roll = keyboard_check_pressed(vk_shift)||gamepad_button_check_pressed(0,gp_face2)
var key_pause = keyboard_check_pressed(vk_escape)||gamepad_button_check_pressed(0,gp_start)

var move = key_right - key_left !=0
var move_pressed = key_right_pressed - key_left_pressed !=0

verticalspd+=gravid
verticalspd=clamp(verticalspd,verticalspdmin,verticalspdmax)

if move{
	sprite_index = spr_nedekyn_run
	direcao=point_direction(0,0,key_right-key_left,0  )
	velocidade=aprroach(velocidade,velocidademaxima,aceleracao)
}
else{
	sprite_index=spr_nedekyn_idle
	velocidade=aprroach(velocidade,0,desaceleracao)
}
podemexer =lerp(podemexer,0,0.5)
if podemexer<=0 horizontalspd = lengthdir_x(velocidade,direcao)

if horizontalspd!=0{
	
	x_scale = sign(horizontalspd)
}

var chao = place_meeting(x,y+1,obj_block)
var parede = place_meeting(x+1,y,obj_block)||place_meeting(x-1,y,obj_block)


if chao{
	coyotetime=coyotetimemax
}
else{
	coyotetime --
	if verticalspd <0{
	sprite_index=spr_nedekyn_jump1
	}
	if verticalspd>0{
	sprite_index=spr_nedekyn_fall
	if image_index>=image_number-1{
		image_index=image_number-1
	}
}
}

if chao{
	pulos=2
}
if !chao && pulos=2 && coyotetime=0{
	pulos=1
}
if key_jump{
	if pulos = 1{
		var vibra = instance_create_depth(x,y,depth,obj_vibracao)
		vibra.strengh_left = 3
		vibra.strengh_right = 3
		instance_create_layer(x,y,"Instances",obj_efeito_duplopulo)
	}
}

if key_jump and coyotetime>0 and pulos>0{
	coyotetime=0
	verticalspd=0
	verticalspd-=alturapulo
}
if coyotetime>0 && !parede{
	pulos=2
}
if key_jump and pulos>0{
	verticalspd=0
	pulos--
	verticalspd-=alturapulo
}
if place_meeting(x-1,y,obj_block) and !chao and coyotetime<=0 and verticalspd>-2{
	pulos=0
	if verticalspd>2{
		var vibra = instance_create_depth(x,y,depth,obj_vibracao)
		vibra.strengh_left = 2
		vibra.strengh_right = 2
	scr_camera_shake(1)
	pulos=0
	verticalspd=2
	sprite_index=spr_nedekyn_wall
	}

	horizontalspd=0
		if place_meeting(x-1,y,obj_block){
		x_scale=-1
		}
		
	if key_jump{
	
		scr_camera_shake(4)
		podemexer=2
		pulos=0
		coyotetime=0
		verticalspd=0
		verticalspd=-alturapulo
		horizontalspd=-5*x_scale
		
	}
	
}
if place_meeting(x+1,y,obj_block) and !chao and coyotetime<=0 and verticalspd>-2{
	pulos=0
	if verticalspd>2{
		var vibra = instance_create_depth(x,y,depth,obj_vibracao)
		vibra.strengh_left = 2
		vibra.strengh_right = 2
	scr_camera_shake(1)
	pulos=0
	verticalspd=2
	sprite_index=spr_nedekyn_wall
	}

	horizontalspd=0
		if place_meeting(x+1,y,obj_block){
		x_scale=1
		}
	if key_jump{
		
		scr_camera_shake(4)
		podemexer=2
		pulos=0
		coyotetime=0
		verticalspd=0
		verticalspd=-alturapulo
		horizontalspd=-5*x_scale
		
	}
	


}
if !place_meeting(x,y+1,obj_block) and key_down and key_jump  {
	pulos=0
	estado = scr_nedekyn_smash
	verticalspd=-7
	verticalspdmin=-30
	verticalspdmax=30
	instance_create_layer(x,y,"Instances",obj_efeito_duplopulo)

}
}
function scr_nedekyn_smash(){
	gravid = 0.4
	if verticalspd<0{
		sprite_index=spr_nedekyn_jump1
	}
	if verticalspd>0{
		gravid=3
		sprite_index=spr_nedekyn_fall
	}
	horizontalspd=0
	verticalspd+=gravid
	
		if image_index>=image_number-1{
		image_index=image_number-1
	}
	if place_meeting(x,y+1,obj_block){
	    scr_camera_shake(6)
		var vibra = instance_create_depth(x,y,depth,obj_vibracao)
		vibra.strengh_left = 10
		vibra.strengh_right = 10
		sprite_index=spr_nedekyn_down
		if image_index>=image_number-1{
			estado=scr_nedekyn_livre
			gravid=gravidnormal
			verticalspdmin=verticalspdminnormal
			verticalspdmax=verticalspdmax
		}
	}
}