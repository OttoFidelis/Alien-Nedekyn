/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,x_scale,y_scale,0,c_white,1)
if keyboard_check(ord("T")){
	draw_text(x+10,y-100,"hsp:"+string(horizontalspd))
	draw_text(x+10,y-80,"Vsp:"+string(verticalspd))
}



