// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nedekyn_andando(){
	//Otto -- mexe representa os botões que fazem o Nedekyn andar 
	var move=0
	mexe =  - keyboard_check(ord("A")) - keyboard_check(vk_left) - gamepad_button_check(0,gp_padl) +keyboard_check(ord("D")) +keyboard_check(vk_right)+ gamepad_button_check(0,gp_padr) 
	if mexe>0 move =1
	if mexe<0 move =-1
	if mexe = 0 move = 0
//podeandandospd é a permissão que o nedekyn tem para pular, se for 0, o nedekyn anda 
podeandandospd=lerp(podeandandospd,0,0.5)	
if podeandandospd<=0 andandospd=move*spid
//se o Nedekyn encosta na parede enquando anda, o Nedekyn para
if place_meeting(x+andandospd,y,obj_block){
	while !place_meeting(x+sign(andandospd),y,obj_block){
		x+=sign(andandospd)
	}
	andandospd=0
}


//Otto -- esse código representa a direção que o Nedekyn está
if place_meeting(x,y+1,obj_block){

if andandospd!=0{
	sprite_index = spr_nedekyn_run

}
if andandospd=0{
    sprite_index = spr_nedekyn_idle
}

}
//Otto -- esse código muda a direção que o Nedekyn olha
if andandospd>0{
	image_xscale=1
}
if andandospd<0{
	image_xscale=-1
}
x+=andandospd
//Otto -- colisão do ataque físico e mudança de esta para atacando
if place_meeting(x,y+1,obj_block){
if keyboard_check_pressed(ord("V"))||gamepad_button_check_pressed(0,gp_face3){
	esta = scr_nedekyn_atacando
	image_index=0
//Otto -- hitbox que causa dano no inimigo
	if image_xscale= 1{
	instance_create_layer(x+20,y-1,"Instances", obj_colisao)
	}
	if image_xscale= -1{
	instance_create_layer(x-20,y-1,"Instances", obj_colisao)
	}
}
}

}

//pulo
function scr_nedekyn_pulando(){
	pular = keyboard_check_pressed(vk_space)||gamepad_button_check_pressed(0,gp_face1)
	pularhold = keyboard_check(vk_space)||gamepad_button_check(0,gp_face1)
	//Otto -- e o Nedekyn encosta no chão, ele para de cair
	if place_meeting(x,y+pulandospd,obj_block){
	while !place_meeting(x,y+sign(pulandospd),obj_block){
		y+=sign(pulandospd)
	}
	pulandospd=0
}
y+=pulandospd
//Otto -- se o Nedekyn faz pulo duplo, aparece a fumacinha em baixo dele

if pular =1 {
			if pulos =1{
				if !place_meeting(x+image_xscale,y,obj_block){
				instance_create_layer(x,y-10,"Instances",obj_efeito_duplopulo)
				}
			}
		}
//Otto -- se o Nedekyn está no chão, ele pode pular e ele pode fazer pulo duplo
if place_meeting(x,y+1,obj_block){
	jumptime=0
	pulos=2
}
//Otto -- se não, o Nedekyn cai e ele só pode dar um pulo no ar
if !place_meeting(x,y+1,obj_block){
	pulandospd+=gravid
	if pulos=2{
		pulos=1
	}
}

//Otto -- Se você aperta espaço e não se acabaram a quantidade de pulos que o Nedekyn pode dar, o Nedekyn pula


if pular = 1 && pulos=2  {

	pulandospd=0
	pulandospd=impulsopulospeed
}
if pular = 1 && pulos>0 {

		pulandospd=0
		pulandospd=impulsopulospeed
		pulos-=1
		jumptime=jumpframes
		}
		
		if pulos >=1{
		if !pularhold {jumptime=0}
		if jumptime >0{
			pulandospd=impulsopulospeed
			jumptime--
		}
		}
	if pulos =0{
		if jumptime >0{
			pulandospd=impulsopulospeed
			jumptime--
		}
		}
//Otto -- se o Nedekyn não está no chão, ele exibe a animação de pulo
 
if pulandospd<0{
	sprite_index = spr_nedekyn_jump1	 
}
//Otto -- se o Nedekyn está caindo, ele exibe a animação dele caindo
else if pulandospd>0{
	sprite_index = spr_nedekyn_fall
	if image_index>=image_number-1{
		image_index=image_number-1
	}
}
 // Otto -- aqui vai o wall jump
var parede = place_meeting(x+image_xscale,y,obj_block)
if parede {
	if pulandospd>1{
	pulandospd=3
	pulos=1
	podeandandospd=3
	if pular=1{
		pulandospd=impulsopulospeed
		andandospd=5*image_xscale
	}
	sprite_index=spr_nedekyn_wall
	}
}

}



//agachando
function scr_nedekyn_agachando(){
	
agachado = keyboard_check(ord("S"))|| keyboard_check(vk_down)|| gamepad_button_check(0,gp_padd)
//Otto -- se a variável gacha for 0, o Nedekyn não agacha
if gacha=0{
		agachado=0
	}
//Otto -- se o jogador aperta o botão de abaixar, o nedekyn agacha e ele para de andar
if agachado >0{
	sprite_index=spr_nedekyn_down
	spid=0
	mexe=0
}
else{
	spid=spid2
}
//Otto -- se o Nedekyn estiver no ar, ele não agacha
if !place_meeting(x,y+1,obj_block){
	gacha=0
	agachado=0
}
else{
	gacha=1
}
if agachado =1{
	dashspd=0
}
else{
	dashspd=dashspd2
}
}
//atacando
function scr_nedekyn_atacando(){
	andandospd=mexe*spid
	atacspdas=image_xscale*atacspd
	sprite_index = spr_nedekyn_atacando

//Otto -- se o Nedekyn bater na parede enquanto se mexe no ataque, ele para de se mexer no eixo x
	if place_meeting(x+atacspdas,y,obj_block){
		
		while !place_meeting(x+sign(atacspdas),y,obj_block){
			x+=sign(atacspdas)
		}
		
	atacspdas=0
}

x+=atacspdas



    //Otto -- se o Nedekyn está no ar, ele não ataca
	if !place_meeting(x,y+1,obj_block){
		esta=scr_nedekyn_andando
	}
	else{
		atacspd=atacspd2
	}
	//Otto -- se a animação de ataque do Nedekyn acabar, ele volta ao normal
	if scr_fim_animacao(){
		esta = scr_nedekyn_andando	
	}
	
}

function scr_nedekyn_dash(){
	dash = keyboard_check_pressed(ord("B"))
}
function scr_nedekyn_wall_jump(){

    
}