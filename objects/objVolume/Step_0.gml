/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_right)){
	if(vol<= maxVol){	
		vol+=3;}
	audio_sound_gain(backgroundMusic, vol/100, 0)
}
else if(keyboard_check(vk_left)){
	if(vol>= minVol){
		vol-=3;}
	audio_sound_gain(backgroundMusic, vol/100, 0)
}
else if(keyboard_check_pressed(vk_escape)){
	room_goto(StartScreen);
}