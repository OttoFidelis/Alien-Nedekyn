/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_nedekyn_nave){
part_emitter_region(sistema,emitter,obj_nedekyn_nave.x-400,obj_nedekyn_nave.x+250,obj_nedekyn_nave.y,obj_nedekyn_nave.y,ps_shape_ellipse,ps_distr_linear)
part_emitter_burst(sistema,emitter,tipo,10)
}
