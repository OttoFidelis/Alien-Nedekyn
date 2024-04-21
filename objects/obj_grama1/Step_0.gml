/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
script_execute(estado)
if place_meeting (x,y-5,obj_efeito_tiro_impacto_chao) || place_meeting (x,y-5,obj_efeito_tiro_impacto)|| place_meeting(x,y-5,obj_nedekyn_municao){
	estado = scr_grama1_destroy
}