/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
verticalspd=direcao*velocidade

if place_meeting(x,y+sign(verticalspd),obj_colisao_blockmexe){
	direcao *=-1
}
	
var c = place_meeting(x,y+1,obj_nedekyn) or place_meeting(x,y-1,obj_nedekyn)
if c{
	with obj_nedekyn{
			y+=other.verticalspd
		}
	}
y+=verticalspd

if place_meeting(x,y,obj_terra_raioeletromagnetico){
obj_terra_raioeletromagnetico.verticalspd=verticalspd
}







