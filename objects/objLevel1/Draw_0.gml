/// @draws inventory
// You can write your code in this editor
// inventory slot size
//draw_text(100,100, test);
var slot_sizex = 64;
var slot_sizey = 64;

var x1 = inv_posx;
var y1 = inv_posy;
var x2 = inv_posx + (num_slotsx * slot_sizex);
var y2 = inv_posy + (num_slotsy * slot_sizey);

// inventory background
draw_set_color(c_dkgray);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_color(c_white);

for(var i=0;i<num_slotsx;i++){
	for(var j=0;j<num_slotsy;j++){
		var x1 = inv_posx + i * slot_sizex;
		var y1 = inv_posy + j * slot_sizey;
		var x2 = inv_posx + (1 + i) * slot_sizex;
		var y2 = inv_posy + (1 + j) * slot_sizey;
		
		// draw the slots
		draw_rectangle(x1,y1,x2,y2, true);
		if(equipped == listId[i]){
			global.inventory[i,j] = animalList.empty;	
		}
		
		// draw animals into slots
		if(global.inventory[i,j] != animalList.empty){
			draw_sprite(sprAnimalList, global.inventory[i,j], inv_posx + i * slot_sizex + 32, inv_posy + j * slot_sizey + 32);
		}
	}
}

// draw cursor for mouse
for(var i=0;i<num_slotsx;i++){
	for(var j=0;j<num_slotsy;j++){
		var x1 = inv_posx + i * slot_sizex;
		var y1 = inv_posy + j * slot_sizey;
		var x2 = inv_posx + (1 + i) * slot_sizex;
		var y2 = inv_posy + (1 + j) * slot_sizey;
		
		// check if mouse hover into slots
		if(mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2){
			if(global.inventory[i,j] != animalList.empty){
				draw_set_color(c_aqua);
				draw_rectangle(x1,y1,x2,y2,true);
			}
		}
		
		// if mouse clicked
		if(mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2){
			if(mouse_check_button(mb_left)){
				equipped = listId[i];
			} 
		}
	}
}


