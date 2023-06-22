
//andar
script_execute(esta)
//pulo
scr_nedekyn_pulando()
//dash
scr_nedekyn_dash()
//agachar
scr_nedekyn_agachando()
//se o Nedekyn faz dash, ele não pode agachar até a animação de dash acabar

// se o Nedekyn toma dano, ele dá a piscadinha 
if alarm[0] > 0{
	if image_alpha>=1{
		piscadinha = -0.5
	}
	else if image_alpha <=0{
		piscadinha = 0.5
	}
	image_alpha += piscadinha
}
else{
	image_alpha=1
}
//animação parado depois de 10 segundos
//se o Nedekyn não está parado, ele não pode mudar de animação depois de 10 segundos
if mexe != 0{
	alarm[1] = 600
}
//se o Nedekyn está no ar, ele não pode mudar de animação depois de 10 segundos
if pulandospd >= 1{
	alarm[1] = 600
}
//se o Nedekyn está agachado, ele não pode mudar de animação depois de 10 segundos
if agachado=1{
	alarm[1]=600
}
//se o Nedekyn estiver parado por mais de 10 segundos, ele muda de animação
if alarm[1] <= 0{
	sprite_index = spr_nedekyn_dance
}
//se o Nedekyn está fazendo dash, ele não pode mudar de animação depois de 10 segundos
if alarm[3]>0{
	alarm[1] = 600
}
//se o Nedekyn está atacando, ele não pode mudar de animação depois de 10 segundos
if dash=1{
	alarm[1] = 600
}
//se o Nedekyn está pulando, ele não pode mudar de animação depois de 10 segundos
if pular=1{
	alarm[1]=600
}
