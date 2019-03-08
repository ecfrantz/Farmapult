/// @description Insert description here
// You can write your code in this editor
if(thrusting == false){
	event_inherited();
	jetFuel += 1;
}

if(keyboard_check(vk_up) && jetFuel > 20){
	thrusting = true;
	y += -3;
	x += xvel;
	jetFuel -= 10;
}
else if((!keyboard_check(vk_up) && thrusting == true) || jetFuel <= 20){
	thrusting = false;
}