/// @description Insert description here
// You can write your code in this editor
var _spritelargura = sprite_get_width(spr_vida)*2
var _vidafigura = obj_nedekyn.vida
for ( var i = 0; i < _vidafigura; i++ ){
	draw_sprite_ext(spr_vida,0,20 + (_spritelargura*i),20,2,2,0,c_white,1)
	
}

