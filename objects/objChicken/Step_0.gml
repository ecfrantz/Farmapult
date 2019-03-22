/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(keyboard_check_pressed(vk_up) && stamina > 50 && launched == true){
	
	if(yvel > 0){
		yvel = -3;
		stamina -= 50;
	}

}
else if(!keyboard_check_pressed(vk_up) && stamina < maxStamina){
	stamina += .25;
}

if(y > ground){
	stamina = 100;
}


