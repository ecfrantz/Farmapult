/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) || keyboard_check_pressed(vk_escape)){
	room_goto(0);
	audio_stop_sound(backgroundMusic);
}