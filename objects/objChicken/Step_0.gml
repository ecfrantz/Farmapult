/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(keyboard_check_pressed(vk_up) && stamina > 0 && launched == true){
	
	if(yvel > 0){
		yvel = yvel -.2;
		yvel = yvel *-1;
		stamina -= 40;
	}

}
else if(!keyboard_check_pressed(vk_up) && stamina < maxStamina){
	stamina += .2;
}

