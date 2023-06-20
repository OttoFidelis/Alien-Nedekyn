/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_nedekyn)){
x = obj_nedekyn.x - (camera_largura / 2);
y = obj_nedekyn.y - (camera_altura / 2);

x = clamp(x,0,room_width - camera_largura);
y = clamp(y,0,room_height - camera_altura);

camera_set_view_pos(view_camera[0],x,y);
}

