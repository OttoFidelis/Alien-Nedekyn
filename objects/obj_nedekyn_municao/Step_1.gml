/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var key_left = keyboard_check(vk_left)||keyboard_check(ord("A"))||gamepad_button_check(0,gp_padl)
var key_right = keyboard_check(vk_right)||keyboard_check(ord("D"))||gamepad_button_check(0,gp_padr)
var key_down = keyboard_check(vk_down)||keyboard_check(ord("S"))||gamepad_button_check(0,gp_padd)
var key_up = keyboard_check(vk_up)||keyboard_check(ord("W"))||gamepad_button_check(0,gp_padu)
var move = key_right - key_left
var verticalmove=key_down-key_up
var nedekyn=obj_nedekyn








