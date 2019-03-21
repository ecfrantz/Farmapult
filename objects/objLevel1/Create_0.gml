/// @description Insert description here
// You can write your code in this editor
instance_create_layer(96,544,room0,objCow);
//objChicken.launched = true;
//instance_create_layer(200,576,room0,objCow);
//objCow.launched = true;
//instance_create_layer(300,576,room0,objPig);
//objPig.launched = true;

// inventory setup
enum animalList{
	empty = -1,
	cow,
	chicken,
	pig
}

num_slotsx = 3;
num_slotsy = 1;
inv_posx = 125;
inv_posy = 630;

// inventory setup
for(var i = 0; i < num_slotsx; i++){
	for(var j = 0; j < num_slotsy; j++){
		global.inventory[i,j] = animalList.cow;
	}
}
