/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,x_scale,y_scale,0,c_white,1)
if keyboard_check(ord("T")){
	draw_text(x+20,y-100,"Hsp: "+string(horizontalspd))
	draw_text(x+20,y-80,"Vsp: "+string(verticalspd))
	if estado = scr_nedekyn_livre{
	draw_text(x+120,y-100,"Estado: "+"livre")
	}
	if estado = scr_nedekyn_smash{
	draw_text(x+120,y-100,"Estado: "+"esmagando")
	}
	if verticalspd <0{
	draw_text(x+120,y-80,"Estado aereo: "+"subindo")
	}
	if verticalspd >0{
	draw_text(x+120,y-80,"Estado aereo: "+"caindo")
	}
	if verticalspd =0{
	draw_text(x+120,y-80,"Estado aereo: "+"no chao")
	}
	if skin=0{
	draw_text(x+120,y-60,"Skin: "+"Nedekyn")	
	}
	if skin=1{
	draw_text(x+120,y-60,"Skin: "+"Nykeden")	
	}
}



