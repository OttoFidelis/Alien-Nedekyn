
function scr_nedekyn_livre(){
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_jump = keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)

var move = key_right - key_left !=0

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

horizontalspd = lengthdir_x(velocidade,direcao)

if horizontalspd!=0{
	x_scale = sign(horizontalspd)
}

var chao = place_meeting(x,y+1,obj_block)
var parede = place_meeting(x+1,y,obj_block)||place_meeting(x-1,y,obj_block)
var parede_positiva = place_meeting(x+1,y,obj_block)
var parede_negativa = place_meeting(x-1,y,obj_block)

if chao{
	coyotetime=coyotetimemax
	podepular=true
}
else{
	coyotetime --
	if verticalspd <0{
	sprite_index=spr_nedekyn_jump1
	}
	else if verticalspd>0{
	sprite_index=spr_nedekyn_fall
	if image_index>=image_number-1{
		image_index=image_number-1
	}
}
}
if coyotetime>0 and podepular = true {
if key_jump{
if parede_positiva && key_left{
podepular=false
	coyotetime=0
	verticalspd=0
	verticalspd-=alturapulo
}
else if parede_negativa && key_right {
podepular=false
	coyotetime=0
	verticalspd=0
	verticalspd-=alturapulo
}
else{
	podepular=false
	coyotetime=0
	verticalspd=0
	verticalspd-=alturapulo
}
	}
}




}