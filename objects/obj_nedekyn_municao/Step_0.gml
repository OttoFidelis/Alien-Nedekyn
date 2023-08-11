/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if place_meeting(x+horizontalspd,y,obj_block){
	while !place_meeting(x+sign(horizontalspd),y,obj_block){
		x+=sign(horizontalspd)
	}
	
}
if place_meeting(x+sign(horizontalspd),y,obj_block){
	instance_create_layer(x,y,"Efeitos",obj_efeito_tiro_impacto)
	instance_destroy()
}
if obj_nedekyn.estado=scr_nedekyn_livre{
	instance_destroy()
}
if obj_nedekyn.estado=scr_nedekyn_gun{
horizontalspd=maxspd*obj_nedekyn.x_scale
}
x+=horizontalspd





