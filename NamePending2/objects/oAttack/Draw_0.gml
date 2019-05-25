/// @description Insert description here
// You can write your code in this editor
if (sprite_index != -1) {
	draw_self()
}

var MAXLINELENGTH = 50;
if (position_meeting(mouse_x, mouse_y, id) && attackMap != -1) {
	var desc = attackMap[? "desc"];
	var len = string_length(desc);
	var lines = 
    draw_set_colour(c_white);
    draw_rectangle(mouse_x - 32, mouse_y - 64, mouse_x + 32, mouse_y - 32, false);
    draw_set_colour(c_black);
    draw_text(mouse_x - 16, mouse_y - 48, attackMap[? "desc"]);
}