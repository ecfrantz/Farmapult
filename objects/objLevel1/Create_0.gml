/// @description Insert description here
// You can write your code in this editor

//instance_create_layer(96,544,room0,objCow);

//objChicken.launched = true;
//instance_create_layer(200,576,room0,objCow);
//objCow.launched = true;
//instance_create_layer(300,576,room0,objPig);
//objPig.launched = true;

//test = "testing";
audio_play_sound(backgroundMusic, 0,1);

// inventory setup
enum animalList{
	empty = -1,
	cow,
	chicken,
	pig
}

// id to iterate list
listId[0] = 0;
listId[1] = 1;
listId[2] = 2;
// list
list[0] = animalList.chicken;
list[1] = animalList.chicken;
list[2] = animalList.chicken;
// boolean id to check if done
done[0] = false;
done[1] = false;
done[2] = false;

// default equip
equipped = listId[0];
if(list[equipped] == animalList.cow){
	object = objCow;
}
else if(list[equipped] == animalList.chicken){
	object = objChicken;
}
else{
	object = objPig;
}

instance_create_depth(96,544,level1,object);

num_slotsx = 3;
num_slotsy = 1;
inv_posx = 125;
inv_posy = 630;

// inventory setup
for(var i = 0; i < num_slotsx; i++){
	for(var j = 0; j < num_slotsy; j++){
		global.inventory[i,j] = list[i];
	}
}

global.shots= 5;
global.finish = false;