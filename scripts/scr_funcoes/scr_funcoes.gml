// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_funcoes(){

}
function scr_camera_shake(treme){
	var shake = instance_create_layer(0,0,"Camera",obj_camera_shake)
		shake.shake = treme
}