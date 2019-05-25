/// @description Insert description here
// You can write your code in this editor
if (sprite_index != -1) {
	draw_self()
}


if (position_meeting(mouse_x, mouse_y, id)) {
   draw_set_colour(c_white);
   draw_rectangle(x - 32, y - 64, x + 32, y - 32, false);
   draw_set_colour(c_black);
   draw_text(x - 16, y - 48, "Tooltip Text");
}