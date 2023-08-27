/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_nedekyn_municao){
if obj_nedekyn.estado=scr_nedekyn_gun and obj_nedekyn.gun>0  and  obj_nedekyn.skin=1{
part_emitter_region(sistema,emitter,obj_nedekyn_municao.x,obj_nedekyn_municao.x,obj_nedekyn_municao.y,obj_nedekyn_municao.y,ps_shape_ellipse,ps_distr_linear)
part_emitter_burst(sistema,emitter,tipo,5)
}
}
