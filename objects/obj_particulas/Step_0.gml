/// @description Insert description here
// You can write your code in this editor
if instance_exists(global.view_target){
if obj_nedekyn.verticalspd>8 and obj_nedekyn.estado=scr_nedekyn_smash{
part_emitter_region(sistema,emitter,obj_nedekyn.x,obj_nedekyn.x,obj_nedekyn.y,obj_nedekyn.y,ps_shape_ellipse,ps_distr_linear)
part_emitter_burst(sistema,emitter,tipo,50)
}
}

