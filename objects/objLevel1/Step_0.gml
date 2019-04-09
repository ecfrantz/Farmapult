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
				if(object.goal == false){
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
				instance_create_layer(96,544,level1,object);
			} 
		}
		
		if(object.goal != false){
			instance_destroy(object);
			equipped = listId[equipped+1];	
		}
	}
}
