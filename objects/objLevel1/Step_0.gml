/// @description Insert description here
// You can write your code in this editor
var slot_sizex = 64;
var slot_sizey = 64;

var x1 = inv_posx;
var y1 = inv_posy;
var x2 = inv_posx + (num_slotsx * slot_sizex);
var y2 = inv_posy + (num_slotsy * slot_sizey);

for(var i=0;i<num_slotsx;i++){
	for(var j=0;j<num_slotsy;j++){
		var x1 = inv_posx + i * slot_sizex;
		var y1 = inv_posy + j * slot_sizey;
		var x2 = inv_posx + (1 + i) * slot_sizex;
		var y2 = inv_posy + (1 + j) * slot_sizey;
		
		// if mouse clicked
		if(mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2){
			if(mouse_check_button(mb_left)){
				//if(object.goal == false){
				//	global.inventory[equipped,j] = list[equipped];
				//}
				draw_text(100,100, "Drawing animals");
				if(done[equipped] == false){
					global.inventory[equipped,j] = list[equipped];
				}
				equipped = listId[i];
				// destroy current object
				instance_destroy(object);
				if(list[equipped] == animalList.cow){
					object = objCow;
				}
				else if(list[equipped] == animalList.chicken){
					object = objChicken;
				}
				else{
					object = objPig;
				}
				// create new object onclick
				
				instance_create_depth(96,544,level1,object);
				//test = "animals drawn"
			} 
		}
		with object{
			image_angle = objCannon.image_angle;
			if(place_meeting(x,y,objBarn)){
				if(global.shots == 0){
					global.finish = true;
				}
				objLevel1.done[objLevel1.equipped] = true;
				audio_play_sound(goalSound,10,false);
				instance_destroy();
				objCannon.image_angle = 0;
				if(objLevel1.done[0] && objLevel1.done[1] && objLevel1.done[2] && global.finish){
						global.finish = false;
				}
			}
		}
		
		if(done[equipped] == true){
			for(var temp=0;temp<3;temp++){
				if (done[temp] == false){
					equipped = temp;
					break;
				}
			}
			if(done[equipped] == false){
					global.inventory[equipped,j] = list[equipped];
				}
				equipped = listId[i];
				// destroy current object
				instance_destroy(object);
				if(list[equipped] == animalList.cow){
					object = objCow;
				}
				else if(list[equipped] == animalList.chicken){
					object = objChicken;
				}
				else{
					object = objPig;
				}
				// create new object onclick
				instance_create_depth(96,544,level1,object);
		}
		
		if(global.finish){
			audio_play_sound(Fail,10,false);
			global.lvl1 = false;
			show_debug_message("lvl 1 step debug");
			instance_destroy(objCannon);
			//instance_deactivate_all(1);
			audio_stop_all();
			if(keyboard_check(ord("Y"))){
				room_restart();
			}
			else if(keyboard_check(ord("N"))){
				game_end();
			}
		}
		
		if(done[0] && done[1] && done[2]){
			instance_destroy(objCannon);
			instance_deactivate_all(1);
			audio_stop_all();
			//room_goto(level2);
			if(keyboard_check(ord("Y"))){
				room_goto(level2);
			}
			else if(keyboard_check(ord("N"))){game_end();}
		}
	}
}
