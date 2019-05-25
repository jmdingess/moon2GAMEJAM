/// @description Insert description here
// You can write your code in this editor
if (sprite_index != -1) {
	draw_self()
}

// Mouseover text
if (position_meeting(mouse_x, mouse_y, id) && attackMap != -1) {
	// Format description; really this should all be done once and saved instead of every tick but 
	// it's like this for now
	var MAXLINELENGTH = 26;
	var name = attackMap[? "displayName"];
	var desc = attackMap[? "desc"];
	var len = string_length(desc);
	var lines = 1 + ceil(len/MAXLINELENGTH);
	var i = MAXLINELENGTH;
	var j;
	// Add whitespace to desc at MAXLINELENGTH intervals, looking backward for spaces to put them on
	while (i < len) {
		j = i;
		while (0 <= j && i-j < MAXLINELENGTH && string_char_at(desc, j) != " ") {
			j--;
		}
		desc = string_insert("\n", desc, j + 1);
		i = j + MAXLINELENGTH + 1;
	}
    draw_set_colour(c_white);
    draw_rectangle(mouse_x + 8, mouse_y - 64, mouse_x + 256, mouse_y - 64 + (32*lines), false);
    draw_set_colour(c_black);
	draw_text(mouse_x + 18, mouse_y - 54, name);
    draw_text(mouse_x + 18, mouse_y - 22, desc);
}