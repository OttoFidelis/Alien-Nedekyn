/// @description Insert description here
// You can write your code in this editor
sistema = part_system_create()
tipo = part_type_create()
emitter = part_emitter_create(sistema)
part_type_shape(tipo,pt_shape_smoke)
part_type_alpha2(tipo,0.15,0)
part_type_color3(tipo,c_silver,c_gray,c_dkgray)
part_type_size(tipo,0.5,2,0,0)
part_type_speed(tipo,0.3,3,0,0)
part_type_direction(tipo,0,180,0,0)
part_type_life(tipo,40,300)
part_type_orientation(tipo,0,0,0,0,0)