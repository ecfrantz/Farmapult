/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_right)){
	if(global.vol<= maxVol){	
		global.vol+=3;}
	audio_sound_gain(backgroundMusic, global.vol/100, 0)
}
else if(keyboard_check(vk_left)){
	if(global.vol>= minVol){
		global.vol-=3;}
	audio_sound_gain(backgroundMusic, global.vol/100, 0)
}
else if(keyboard_check_pressed(vk_escape)){
	room_goto(StartScreen);
}