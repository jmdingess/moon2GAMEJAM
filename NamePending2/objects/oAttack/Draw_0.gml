/// @description Insert description here
// You can write your code in this editor
if (sprite_index != -1) {
	draw_self()
}


if (position_meeting(mouse_x, mouse_y, id)) {
   draw_set_colour(c_white);
   draw_rectangle(mouse_x - 32, mouse_y - 64, mouse_x + 32, mouse_y - 32, false);
   draw_set_colour(c_black);
   draw_text(mouse_x - 16, mouse_y - 48, "Tooltip Text");
}