                    /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if place_meeting(x,y+sign(speed),obj_block){
	instance_create_layer(x,y,"Particulas",obj_efeito_tiro_impacto)
	instance_destroy()
}
if place_meeting(x+sign(speed),y,obj_block) and !place_meeting(x,y-1,obj_block){
	instance_create_layer(x,y,"Particulas",obj_efeito_tiro_impacto)
	instance_destroy()
}




