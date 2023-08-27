
function scr_nedekyn_livre(){
	// botões do jogo em variáveis locais
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_left_pressed = keyboard_check_pressed(vk_left)||keyboard_check_pressed(ord("A"))||gamepad_button_check_pressed(0,gp_padl)
var key_right_pressed = keyboard_check_pressed(vk_right)||keyboard_check_pressed(ord("D"))||gamepad_button_check_pressed(0,gp_padr)
var key_left_released = keyboard_check_released(vk_left)||keyboard_check_released(ord("A"))||gamepad_button_check_released(0,gp_padl)
var key_right_released = keyboard_check_released(vk_right)||keyboard_check_released(ord("D"))||gamepad_button_check_released(0,gp_padr)
var key_jump = keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
var key_jumphold = keyboard_check(vk_space)||gamepad_button_check(0,gp_face1)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var key_attack = keyboard_check_pressed(ord("V"))||gamepad_button_check_pressed(0,gp_face4)
var key_gun = keyboard_check(ord("B"))||gamepad_button_check(0,gp_face3)
var key_dodge = keyboard_check_pressed(ord("C"))||gamepad_button_check_pressed(0,gp_face2)
var key_pause = keyboard_check_pressed(vk_escape)||gamepad_button_check_pressed(0,gp_start)
var key_skin = keyboard_check_pressed(ord("R"))
// código de configuração de skins
if key_skin{
	skin+=1
}
if skin>2 skin=0
// Código da corrida
var move = key_right - key_left !=0 // valor de move baseado nas teclas de andar
var move_pressed = key_right_pressed - key_left_pressed !=0 
// código de gravidade
if !place_meeting(x,y+1,obj_block){
verticalspd+=gravid
}
// limitador de velocidade vertical
verticalspd=clamp(verticalspd,verticalspdmin,verticalspdmax)

// código dos sprites ( parado e correndo )
if horizontalspd!=0{
	sprite_index = spr_nedekyn_run
	if skin=1{
			sprite_index = spr_nykeden_run
		}
		if skin=2{
			sprite_index = spr_redekyn_run
		}
	}
	else{
		sprite_index=spr_nedekyn_idle
		if skin=1{
			sprite_index = spr_nykeden_idle
		}
		if skin=2{
			sprite_index = spr_redekyn_idle
		}
	}
	// configuração de velocidade de corrida
if move{
	direcao=point_direction(0,0,key_right-key_left,0  )
	velocidade=aprroach(velocidade,velocidademaxima,aceleracao) // aprroach é tipo o lerp, só que melhor
}
else{
	sprite_index=spr_nedekyn_idle
	if skin=1{
			sprite_index = spr_nykeden_idle
		}
		if skin=2{
			sprite_index = spr_redekyn_idle
		}
	velocidade=aprroach(velocidade,0,desaceleracao)
}

// pode mexer define quando o Nedekyn pode andar, se for 0 ou negativo, o nedekyn pode andar
podemexer =lerp(podemexer,0,0.8)
if podemexer<=0 horizontalspd = lengthdir_x(velocidade,direcao)

// x_scale é a direção que o Nedekyn olha
if horizontalspd!=0{
	x_scale = sign(horizontalspd)
}
// variáveis locais da colisão
var chao = place_meeting(x,y+1,obj_block)
var parede = place_meeting(x+1,y,obj_block)||place_meeting(x-1,y,obj_block)

// código do coyote time
/*
coyote time é o tempo que o Nedekyn tem para pular depois que ele sai do chão sem pular
o coyote time serve para melhorar a jogabilidade, facilitando o jogo
*/
if chao{
	coyotetime=coyotetimemax
	pulos=1
}
// se o Nedekyn não está no chão, o coyote time diminui 
else{
	coyotetime --
	if verticalspd <0{
	sprite_index=spr_nedekyn_jump1 // sprite do Nedekyn pulando
	if skin=1{
		sprite_index=spr_nykeden_jump
	}
	if skin=2{
		sprite_index=spr_redekyn_jump
	}
	}
	if verticalspd>0{
	sprite_index=spr_nedekyn_fall // sprite do Nedekyn caindo
	if skin=1{
		sprite_index=spr_nykeden_fall
		if image_index>=image_number-1{
		image_index=image_number-1 // código para a animação de queda não ficar em loop
	}
	}
	if skin=2{
		sprite_index=spr_redekyn_fall
		if image_index>=image_number-1{
		image_index=image_number-1 // código para a animação de queda não ficar em loop
	}
	}
	if image_index>=image_number-1{
		image_index=image_number-1
	}

}
}
// pulos é o limites de pulos que o Nedekyn pode dar
if coyotetime<=0{
	coyotetime=0
	pulos=0
}
if key_jump coyotetime=0

if chao jumptime=0


if key_jump and pulos=1{
	jumptime=jumptimemax
	pulos--
}
if jumptime>0 verticalspd-=alturapulo
if !key_jumphold jumptime=0
if key_jump and coyotetime>0 and !chao{
	coyotetime=0
	verticalspd=0
	verticalspd-=alturapulo
}
jumptime--	


//código que define quando o limites de pulos diminui

 




//Aqui termina o código do smash e começa o da esquiva
if place_meeting(x,y+1,obj_block) and key_dodge and alarm[1]<=0{
	scr_camera_shake(1)
	estado = scr_nedekyn_dodge
	image_index=0
	instance_create_layer(x,y,"Efeitos",obj_efeito_dodge)
	obj_efeito_dodge.image_xscale = x_scale
}
// Aqui termina o código da esquiva
if place_meeting(x,y,obj_grama1){
	if move{
	horizontalspd=velocidadegrama*x_scale
	}
}
// código que aumenta lentamente a quantidade de munições quando está menor que 100
if tiros>=100{
addtiros=addtirosmax
}
if addtiros<=0{
			tiros++
			addtiros=addtirosmax
		}
if chao {
	if key_gun and tiros>0{
	estado=scr_nedekyn_gun 
	gun=gunmax+1
	}
	}
	if tiros<100{
	    addtiros--
		if addtiros<=0{
			tiros++
			addtiros=addtirosmax
		}
	}
}
// Função da esquiva
function scr_nedekyn_dodge(){

	if skin=0{
	sprite_index=spr_nedekyn_dodge
	}
	if skin=1{
	sprite_index=spr_nykeden_dodge
	}
	if skin=2{
	sprite_index=spr_redekyn_dodge
	}
	horizontalspd = aprroach(19*x_scale*-1,0,1.5)
	if image_index >= image_number-1{
		estado = scr_nedekyn_livre
		alarm[1]=6
	}
	if !place_meeting(x,y+3,obj_block){
		estado = scr_nedekyn_livre
		alarm[1] = 6
	}
	
}
// Função do smash
function scr_nedekyn_smash(){
	gravid = 1.1
	if verticalspd<0{
		sprite_index=spr_nedekyn_jump1
		if skin=1{
			sprite_index = spr_nykeden_jump
		}
		if skin=2{
			sprite_index = spr_redekyn_jump
		}
	}
	if verticalspd>0{
		gravid=8
		sprite_index=spr_nedekyn_fall
		if skin=1{
			sprite_index = spr_nykeden_fall
		}
			if skin=2{
			sprite_index = spr_redekyn_fall
		}
	}
	horizontalspd=0
	verticalspd+=gravid
	
		if image_index>=image_number-1{
		image_index=image_number-1
	}
	if place_meeting(x,y+1,obj_block){
		verticalspd=0
	    scr_camera_shake(4)
		var vibra = instance_create_depth(x,y,depth,obj_vibracao)
		vibra.strengh_left = 10
		vibra.strengh_right = 10
		sprite_index=spr_nedekyn_down
		if skin=1{
		sprite_index=spr_nykeden_down
	}
	if skin=2{
		sprite_index=spr_redekyn_down
	}
		if image_index>=image_number-1{
			estado=scr_nedekyn_livre
			gravid=gravidnormal
			verticalspdmin=verticalspdminnormal
			verticalspdmax=verticalspdmax
		}
	}
}
function scr_nedekyn_gun(){
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var move = key_right - key_left !=0
if key_left x_scale=-1
if key_right x_scale=1
	gun--
	if gun<=0 gun=gunmax
	if tiros>0{
		if gun=gunmax{
	tiros--
	instance_create_layer(x+x_scale*-10,y-65,"instances",obj_nedekyn_municao)
		}
	}
		if move=1 || move=-1 || move=0 {
		if !key_up{
if skin=0 sprite_index = spr_nedekyn_gun
		}
}
if key_right and key_up{
	if skin=0 sprite_index = spr_nedekyn_gun_d_up
}
if key_left and key_up{
if skin=0 sprite_index = spr_nedekyn_gun_d_up
}
if  move=1 and key_down{
if skin=0 sprite_index = spr_nedekyn_gun_d_down
}
if move=-1 and key_down{
if skin=0 sprite_index = spr_nedekyn_gun_d_down
}
if key_up and !key_right and !key_left{
sprite_index=spr_nedekyn_gun_up
}
	var chao = place_meeting(x,y+1,obj_block)
	var key_gun = keyboard_check(ord("B"))||gamepad_button_check(0,gp_face3)

	if !key_gun || !chao || tiros<=0 estado = scr_nedekyn_livre
	horizontalspd=0
	verticalspd=0
}