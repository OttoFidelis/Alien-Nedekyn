draw_self()

if keyboard_check(ord("T")){
draw_text(x,y-100,"X: " + string(x))
draw_text(x,y-80,"y: " + string(y))

draw_text(x+120,y-100,"Xmove: " + string(mexe))

if !place_meeting(x,y+pulandospd,obj_block){
	if pulandospd > 0{
	draw_text(x+210,y-80,"Caindo ")
	
}
}

	if andandospd < 0{
	draw_text(x+210,y-100,"Esquerda ")
}
if andandospd > 0{
	draw_text(x+210,y-100,"Direita ")
}
if andandospd = 0{
	draw_text(x+210,y-100,"Parado ")
}
if pulandospd < 0{
	draw_text(x+210,y-80,"Subindo")
}
if pulandospd = 0{
	if keyboard_check(vk_down){
	draw_text(x+120,y-80,"Agachado")
	
	}
}
    
	draw_text(x+120,y-80,"pulos: "+ string(pulos))
    
}