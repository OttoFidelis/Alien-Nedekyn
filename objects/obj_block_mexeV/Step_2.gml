/// @description Insert description here
// You can write your code in this editor
x += moveX
y += moveY

if comecando && point_distance(x,y,startX,startY) < atualspd{
	comecando = false
	atualspd = 0
	alarm[0] = tempoDeEspera
}
else if !comecando and point_distance(x,y,endX,endY) < atualspd{
	comecando = true
	atualspd = 0
	alarm[0] = tempoDeEspera
}



