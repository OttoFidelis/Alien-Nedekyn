/// @description Insert description here
// You can write your code in this editor
sistema = part_system_create()
tipo = part_type_create()
emitter = part_emitter_create(sistema)
part_type_shape (tipo,pt_shape_explosion)
part_type_alpha2(tipo,1,0)
part_type_color3(tipo,c_yellow,c_lime,c_green)
part_type_size(tipo,0.02,0.2,0,0)
part_type_speed(tipo,2,12,0,0)
part_type_direction(tipo,20,160,0,0)
part_type_life(tipo,10,40)
part_type_orientation(tipo,70,110,0,0,0)