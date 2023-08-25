/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
estado = noone
alvo=noone
estado_parado= function(){
	
}
estado_nedekyn = function(){
	if instance_exists(obj_nedekyn){
	alvo=obj_nedekyn
	}
	else{ 
		estado= estado_parado 
		exit
	}
	x=alvo.x
	y=alvo.y
}
estado=estado_nedekyn





