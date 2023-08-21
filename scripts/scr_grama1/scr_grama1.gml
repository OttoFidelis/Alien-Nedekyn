// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_grama1_livre(){
sprite_index=spr_grama1
if place_meeting (x,y,obj_nedekyn)  {
	estado = scr_grama1_down
	alarm[0]=2.5
}
if place_meeting (x,y-5,obj_efeito_tiro_impacto_chao){
	estado = scr_grama1_destroy
}
}
function scr_grama1_down(){
	if image_index>=image_number-1 and sprite_index!=spr_grama1_2 image_index=0
	if !place_meeting(x,y,obj_nedekyn) and alarm[0]<=0{
	estado = scr_grama1_subindo
	}
	if place_meeting (x,y,obj_nedekyn) {
	alarm[0]=2.5
	}
	sprite_index=spr_grama1_2
	if image_index<image_number-1{
	image_xscale=obj_nedekyn.x_scale
	}
	if image_index>=image_number-1{
		image_index=image_number-1
	}
	if obj_nedekyn.estado=scr_nedekyn_smash{
	estado=scr_grama1_destroy
		}
}

function scr_grama1_subindo(){
	if image_index>=image_number-1 and sprite_index=spr_grama1_2 image_index=0
	sprite_index=spr_grama1_3
	if sprite_index=spr_grama1_3 and image_index>=image_number-1{
		estado=scr_grama1_livre
	}
}
function scr_grama1_destroy(){
	if image_index>=image_number-1 and sprite_index!=spr_grama1_desfazendo image_index=0
	if image_index=0{
	image_xscale=obj_nedekyn.x_scale
	}
	sprite_index=spr_grama1_desfazendo
	image_alpha-=0.05
	if sprite_index=spr_grama1_desfazendo and image_index>=image_number-1{
		instance_destroy()
	}
}