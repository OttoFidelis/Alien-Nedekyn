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
	if alvo.horizontalspd=0 and x!=alvo.x {x=aprroach(x,alvo.x,2.4)}
	else{x= aprroach(x,alvo.x,5.5)}
	if alvo.estado=scr_nedekyn_dodge x=aprroach(x,alvo.x,20)
	y=aprroach(y,alvo.y,14)
}
estado=estado_nedekyn





