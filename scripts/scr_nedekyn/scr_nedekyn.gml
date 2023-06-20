// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nedekyn_andando(){
	//mexe representa os botões que fazem o Nedekyn andar 
	mexe =  - keyboard_check(ord("A"))+keyboard_check(ord("D"))
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
	if pular = 1{
        image_index=0
		pulandospd=impulsopulospeed
		}
	
}
else{
	pulandospd+=gravid
}

//se o Nedekyn não está no chão, ele exibe a animação de pulo
 
if pulandospd<0{
	sprite_index = spr_nedekyn_jump1
	if keyboard_check_pressed(ord("C")){
		sprite_index=spr_nedekyn_dash
	}
}
else if pulandospd>0{
	sprite_index = spr_nedekyn_fall
	
	if image_index>=image_number-1{
		image_index=image_number-1
	}
}
 
}

//dash
function scr_nedekyn_dash(){
dash = +keyboard_check_pressed(ord("C"))
//velocidade do dash
andandospd = lerp(spid,dashspd,0.1)*image_xscale
// se o Nedekyn encosta na parede enquanto faz o dash, ele para
	if place_meeting(x+andandospd,y,obj_block){
		
		andandospd=0
		dashes2=0
	}
	// se o Nedekyn não está no chão, ele só faz um dash
if !place_meeting (x,y+1,obj_block){
	if dashes = 0{
		dash = 0
	}
	if dash = 1{
		dashes-=1
	}
}
	else{
	dashes = 1
}

//se o Nedekyn está no ar, ele está liberado para dar dash, mesmo se ele tinha acabado de dar dash no chão
	if pulandospd !=0{
	alarm[4]=0
}
//se  ele acabou de dar dash, ele só pode dar dash de novo depois de 1 segundo
if dashes2 = 0{
		dash = 0
}

if alarm[4]>0{
	dashes2 = 0
}
else{
	dashes2 = 1
}
//Se o jogador aperta o botão de dash, animação de dash reinicia
if dash = 1 {
	image_index = 0
	alarm[3] = 12
}
//se o Nedekyn faz o dash, ele acelera na direção que ele está e ele para de cair ou subir quando pula
if alarm[3]>0{
	
	esta=scr_nedekyn_dash
	
alarm[4]=15
	
	gravid = 0
	impulsopulospeed = 0
	pulandospd = 0
	if mexe = 0{
		x+=andandospd
	}
	else{
		x+=andandospd
	}
	}
if esta=scr_nedekyn_dash{
	sprite_index=spr_nedekyn_dash
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

