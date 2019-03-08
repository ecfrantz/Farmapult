/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_left) && launched == false){
	image_angle = image_angle + 5;
}

if(keyboard_check(vk_right) && launched ==false){
	image_angle = image_angle - 5;
}

if(keyboard_check(vk_up) && launched == false){
	launched = true;
	xvel = totvel*cos(image_angle*(pi/180));
	yvel = totvel*sin(image_angle*(pi/180)+180);
	grav = .05;
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

if(xvel ==0 && yvel == 0){
	x = xStart;
	y = belowGround;
	launched = false;
}
