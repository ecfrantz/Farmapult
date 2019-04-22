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
				
				instance_create_depth(96,544,level3,object);
				test = "animals drawn"
			} 
		}
		with object{
			image_angle = objSlingshot.image_angle;
			if(place_meeting(x,y,objBarn)){
				if(global.shots == 0){
					global.finish = true;
				}
				objLevel3.done[objLevel3.equipped] = true;
				audio_play_sound(goalSound,10,false);
				instance_destroy();
				objSlingshot.image_angle = 0;
				if(objLevel3.done[0] && objLevel3.done[1] && objLevel3.done[2] && global.finish){
					global.finish = false;
				}
			}
			if(place_meeting(x,y,objTractor)){
				objLevel3.hitTractor[objLevel3.equipped] = true;
				instance_destroy();
				instance_create_depth(x,y,level3, objExplosion);

			}
		}	
		if(done[equipped] == false && hitTractor[equipped] == true){
			show_debug_message("hit truck");
			instance_destroy(objTractor);
			hitTractor[equipped] = false;
			alarmval = false;
			alarm[2] = 3;
		}
		if(alarmval == true){
			show_debug_message("creating new object");
			instance_create_depth(96,544,level3,object);
			alarmval = false;
			hitTractor[equipped] = false;
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
				instance_create_depth(96,544,level3,object);
		}
		
		if(global.finish){
			audio_play_sound(Fail,10,false);
			global.lvl2 = false;
			show_debug_message("lvl 3 step debug");
			instance_destroy(objSlingshot);
			instance_deactivate_all(1);
			audio_stop_all();
			if(keyboard_check(ord("Y"))){
				room_restart();
			}
			else if(keyboard_check(ord("N"))){
				game_end();
			}
		}
		
		if(done[0] && done[1] && done[2]){
			audio_stop_all();
			instance_deactivate_all(1);
			
		}
	}
}
