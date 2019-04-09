/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_green);
draw_rectangle(x + space - 110, y + space -70, x + space + 90, y + space*array_length_1d(menu),false)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_set_font(fnt_options);
draw_set_color(c_white);

var m
for(m = 0; m < array_length_1d(menu); m++){
	draw_text_transformed(x + space, y + (m*space), string(menu[m]),2,2,0)
	
}

draw_sprite(sprite_index, 0, x - 70, y+mpos*space - 10);