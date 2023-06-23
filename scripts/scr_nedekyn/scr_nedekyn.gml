// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nedekyn_andando(){
	//mexe representa os botões que fazem o Nedekyn andar 
	
	mexe =  - keyboard_check(ord("A")) +keyboard_check(ord("D")) 
	
andandospd=mexe*spid
//se o Nedekyn encosta na parede enquando anda, o Nedekyn para
if place_meeting(x+andandospd,y,obj_block){
	while !place_meeting(x+sign(andandospd),y,obj_block){
		x+=sign(andandospd)
	}
	andandospd=0
}
//Esse código representa a direção que o Nedekyn está
if place_meeting(x,y+1,obj_block){
if mexe=1{
	sprite_index = spr_nedekyn_run
	
}
if mexe=-1{
	sprite_index = spr_nedekyn_run

}
if andandospd==0{
    sprite_index = spr_nedekyn_idle
}

}
if mexe=1{
	image_xscale=1
}
if mexe =-1{
	image_xscale=-1
}
x+=andandospd
//colisão do ataque físico
if place_meeting(x,y+1,obj_block){
if keyboard_check_pressed(ord("V")){
	esta = scr_nedekyn_atacando
	image_index=0
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
	pular = +keyboard_check_pressed(vk_space)
	pularhold = +keyboard_check(vk_space)
	//Se o Nedekyn encosta no chão, ele para de cair
	if place_meeting(x,y+pulandospd,obj_block){
	while !place_meeting(x,y+sign(pulandospd),obj_block){
		y+=sign(pulandospd)
	}
	pulandospd=0
}
y+=pulandospd
//se o Nedekyn está no chão, ele pode pular
if place_meeting(x,y+1,obj_block){
	
	pulos=2
}
else{
	pulandospd+=gravid
	if pulos=2{
		pulos=1
	}
}
if pular = 1 && pulos>0{
		pulandospd=impulsopulospeed
		pulos-=1
		jumptime=jumpframes
		}
		if !pularhold {jumptime=0}
		if jumptime >0{
			pulandospd=impulsopulospeed
			jumptime--
		}
		
//se o Nedekyn não está no chão, ele exibe a animação de pulo
 
if pulandospd<0{
	sprite_index = spr_nedekyn_jump1
	
}
else if pulandospd>0{
	sprite_index = spr_nedekyn_fall
	
	if image_index>=image_number-1{
		image_index=image_number-1
	}
}
 
}



//agachando
function scr_nedekyn_agachando(){
	
agachado = +keyboard_check(ord("S"))
if gacha=0{
		agachado=0
	}
if agachado =1{
	sprite_index=spr_nedekyn_down
	spid=0
	mexe=0
}
else{
	spid=spid2
}
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
	
	if place_meeting(x+atacspdas,y,obj_block){
		
		while !place_meeting(x+sign(atacspdas),y,obj_block){
			x+=sign(atacspdas)
		}
		
	atacspdas=0
}

x+=atacspdas



    // se o Nedekyn está no ar, ele não ataca
	if !place_meeting(x,y+1,obj_block){
		esta=scr_nedekyn_andando
	}
	else{
		atacspd=atacspd2
	}
	// se a animação de ataque do Nedekyn acabar, ele volta ao normal
	if scr_fim_animacao(){
		esta = scr_nedekyn_andando	
	}
	
}

