/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_green);
draw_rectangle(x -150, y -30, x + 110, y + 20,false)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text_transformed(x-70,y, "Volume:" , 2,2,0);
draw_healthbar(x+10,y-5,x+100,y+10,global.vol,c_black,c_blue,c_blue,0,true,true);