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
				
				instance_create_depth(96,544,level2,object);
				test = "animals drawn"
			} 
		}
		with object{
			if(place_meeting(x,y,objBarn)){
				objLevel2.done[objLevel2.equipped] = true;
				audio_play_sound(goalSound,10,false);
				instance_destroy();
				
			}
			if(place_meeting(x,y,objTractor)){
				objLevel2.hitTractor[objLevel2.equipped] = true;
				instance_destroy();
				instance_create_depth(x,y,level2, objExplosion);

			}
		}	
		if(done[equipped] == false && hitTractor[equipped] == true){
			show_debug_message("hit truck");
			hitTractor[equipped] = false;
			alarmval = false;
			alarm[2] = 3;
		}
		if(alarmval == true){
			show_debug_message("creating new object");
			instance_create_depth(96,544,level2,object);
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
				instance_create_depth(96,544,level2,object);
		}
		
		if(done[0] && done[1] && done[2]){
			instance_deactivate_all(1);
		}
	}
}
