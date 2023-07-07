/// @description Insert description here
// You can write your code in this editor

horizontalspd=direcao*velocidade

if place_meeting(x+sign(horizontalspd),y,obj_block){
	direcao *=-1
}
x+=horizontalspd
var c = place_meeting(x+sign(horizontalspd),y,obj_nedekyn) or place_meeting(x,y-1,obj_nedekyn)
if c{
	with obj_nedekyn{
		if !place_meeting(x+other.horizontalspd,y,obj_block){
			x+=other.horizontalspd
		}
	}
}


