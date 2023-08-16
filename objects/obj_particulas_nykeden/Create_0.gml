/// @description Insert description here
// You can write your code in this editor
sistema = part_system_create()
tipo = part_type_create()
emitter = part_emitter_create(sistema)
part_type_sprite(tipo,spr_efeito_coracao,0,0,0)
part_type_alpha2(tipo,1,0)
part_type_color3(tipo,make_color_rgb(255,238,255),make_color_rgb(200,23,255),make_color_rgb(140,0,255))
part_type_size(tipo,0.2,0.4,0,0)
part_type_speed(tipo,2,6,0,0)
part_type_direction(tipo,0,180,0,0)
part_type_life(tipo,10,40)
part_type_orientation(tipo,0,0,0,0,0)