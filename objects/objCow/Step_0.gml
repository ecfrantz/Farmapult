/// @description Insert description here
// You can write your code in this editor
if(thrusting == false){
	event_inherited();
	if(jetFuel < 100){
		jetFuel += .5;
	}
}

if(keyboard_check(vk_up) && jetFuel > 0){
	thrusting = true;
	y += -3;
	x += xvel;
	jetFuel -= 1;
}
else if(!keyboard_check(vk_up) && thrusting == true){
	thrusting = false;
}
else if(jetFuel <= 0 && thrusting == true){
	thrusting = false;
	//jetFuel = -5;
}
	