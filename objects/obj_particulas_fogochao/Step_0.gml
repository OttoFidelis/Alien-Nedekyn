/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_grama_bloco2){
part_emitter_region(sistema,emitter,obj_grama_bloco2.x+550,obj_grama_bloco2.x,obj_grama_bloco2.y,obj_grama_bloco2.y,ps_shape_ellipse,ps_distr_linear)
part_emitter_burst(sistema,emitter,tipo,10)
}
