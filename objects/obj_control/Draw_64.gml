/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if keyboard_check_pressed(ord("T")) debug++
if debug>1 debug=0
if debug=1{
	draw_text(x,y+120,"Hsp: "+string(obj_nedekyn.horizontalspd))
	draw_text(x,y+140,"Vsp: "+string(obj_nedekyn.verticalspd))
	draw_text(x,y+160,"Wall time: "+string(obj_nedekyn.walltime))
	draw_text(x,y+180,"Jumptime: "+string(obj_nedekyn.jumptime))
	if obj_nedekyn.podemexer<=0{
	draw_text(x,y,"Pode mexer: "+"sim")
	}
	if obj_nedekyn.podemexer>0{
	draw_text(x,y,"Pode mexer: "+"nao")
	}
	if obj_nedekyn.estado = scr_nedekyn_livre{
	draw_text(x,y+20,"Estado: "+"livre")
	}
	if obj_nedekyn.estado = scr_nedekyn_dodge{
	draw_text(x,y+20,"Estado: "+"esquivando")
	}
	if obj_nedekyn.estado = scr_nedekyn_smash{
	draw_text(x,y+20,"Estado: "+"esmagando")
	}
	if obj_nedekyn.estado = scr_nedekyn_gun{
	draw_text(x,y+20,"Estado: "+"atirando")
	}
	if obj_nedekyn.verticalspd <0{
	draw_text(x,y+40,"Estado aereo: "+"subindo")
	}
	if obj_nedekyn.verticalspd >0{
	draw_text(x,y+40,"Estado aereo: "+"caindo")
	}
	if obj_nedekyn.verticalspd =0{
	draw_text(x,y+40,"Estado aereo: "+"no chao")
	}
	if obj_nedekyn.skin=0{
	draw_text(x,y+60,"Skin: "+"Nedekyn")	
	}
	if obj_nedekyn.skin=1{
	draw_text(x,y+60,"Skin: "+"Nykeden")	
	}
	if obj_nedekyn.skin=2{
	draw_text(x,y+60,"Skin: "+"Redekyn")	
	}
	draw_text(x,y+80,"Coyote time: "+string(obj_nedekyn.coyotetime))	
	draw_text(x,y+100,"Pulos restantes: "+string(obj_nedekyn.pulos))	
	if obj_nedekyn.x_scale=1{
	draw_text(x,y+200,"Direcao: "+"direita")
	}
	if obj_nedekyn.x_scale=-1{
	draw_text(x,y+200,"Direcao: "+"esquerda")
	}
	if obj_nedekyn.horizontalspd!=0{
	draw_text(x,y+220,"Andando")
	}
	if obj_nedekyn.horizontalspd=0{
	draw_text(x,y+220,"Parado")
	}
	draw_text(x,y+240,"Tiros: "+ string (obj_nedekyn.tiros))
}











