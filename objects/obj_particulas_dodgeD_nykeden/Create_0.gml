/// @description Insert description here
// You can write your code in this editor
sistema = part_system_create()
tipo = part_type_create()
emitter = part_emitter_create(sistema)
part_type_shape (tipo,pt_shape_spark)
part_type_alpha2(tipo,0.5,0)
part_type_color3(tipo,c_white,c_fuchsia,c_red)
part_type_size(tipo,0.02,0.4,0,0)
part_type_speed(tipo,2,6,0,0)
part_type_direction(tipo,40,240,0,0)
part_type_life(tipo,10,40)
part_type_orientation(tipo,40,0,0,0,0)