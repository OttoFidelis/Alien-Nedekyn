// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_grama1_livre(){
sprite_index=spr_grama1
if place_meeting (x,y,obj_nedekyn) {
	estado = scr_grama1_down
	alarm[0]=5
}
}
function scr_grama1_down(){
	if image_index>=image_number-1 and sprite_index!=spr_grama1_2 image_index=0
	if !place_meeting(x,y,obj_nedekyn) and alarm[0]<=0{
	estado = scr_grama1_subindo
	}
	if place_meeting (x,y,obj_nedekyn) {
	alarm[0]=5
	}
	sprite_index=spr_grama1_2
	image_xscale=obj_nedekyn.x_scale
	if image_index>=image_number-1{
		image_index=image_number-1
	}
	if obj_nedekyn.estado=scr_nedekyn_smash{
	instance_destroy()
}
}
function scr_grama1_subindo(){
	if image_index>=image_number-1 and sprite_index=spr_grama1_2 image_index=0
	image_xscale=obj_nedekyn.x_scale
	sprite_index=spr_grama1_3
	if sprite_index=spr_grama1_3 and image_index>=image_number-1{
		estado=scr_grama1_livre
	}
}