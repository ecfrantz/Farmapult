/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_left) && launched == false){
	image_angle = image_angle + 5;
}

if(keyboard_check(vk_right) && launched ==false){
	image_angle = image_angle - 5;
}

if(keyboard_check(vk_up) && launched == false){
	pow += powAdd;
	if(pow <= 0 || pow >=100){
		powAdd = powAdd*-1;
	}
	poweredUp = true;
	
}
else if(!keyboard_check(vk_up) && poweredUp == true){
	launched = true;
	totvel = pow/20 + velinit;
	xvel = totvel*cos(image_angle*(pi/180));
	yvel = totvel*sin(image_angle*(pi/180)+180);
	grav = .05;
	poweredUp = false;
	image_index = 1;
	global.shots -= 1;
	with objSlingshot{
		image_speed = 0.5;
	}
}
	with objSlingshot{
		if(image_index == 3){
			image_index = 0;
			image_speed = 0;
		}
	}
yvel += grav;
xvel -= drag;

x += xvel;
y += yvel;

if((y > belowGround && y < ground) && yvel != 0){
	xvel -= .5;
	yvel = yvel * -1;
	grav +=.05;
}
else if(y> ground){
	yvel = 0;
	grav = 0;
}

if(xvel <= 0){
	xvel = 0;
}


if(xvel == 0 && yvel == 0 && launched == true){
	if(global.shots == 0){
		show_debug_message("shot = 0");
		global.finish = true;
	}
	x = xStart;
	y = belowGround;
	objCannon.image_angle = 0;
	launched = false;
	pow = 0;
}

