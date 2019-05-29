/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fRooters);
draw_set_color(c_white);

var m;
for(m = 0; m < ds_list_size(name_list) - 1; m++)
{
	var temp = name_list[| m];
	draw_text(x + space, y + (m * space),temp[? "displayName"]);
}

m += 1;
draw_text(x + space, y + (m * space),name_list[|m]);
draw_sprite(sMapIcon, 0, x + 16, y + mpos * space);