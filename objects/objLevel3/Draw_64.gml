/// @description Insert description here
// You can write your code in this editor
var gui_width   = display_get_gui_width();
var gui_height	= display_get_gui_height()
draw_set_font(defaultfont);
draw_set_color(c_red);
display_set_gui_size(1920,1080);
draw_set_halign(fa_center);
draw_set_halign(fa_middle);

if(done[0] && done[1] && done[2]){
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080);
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "You Win!!!");
}

if(global.finish){
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080);
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "You Lose :(\nDo you want to restart?\nY/N");
}