/// @description Insert description here
// You can write your code in this editor


verticalspd=direcao*velocidade

if place_meeting(x,y+sign(verticalspd),obj_colisao_blockmexe){
	direcao *=-1
}
	sprite_index=spr_block_mexe
var c = place_meeting(x,y+1,obj_nedekyn) or place_meeting(x,y-1,obj_nedekyn)
if c{
	with obj_nedekyn{
			y+=other.verticalspd
		}
	}
y+=verticalspd


