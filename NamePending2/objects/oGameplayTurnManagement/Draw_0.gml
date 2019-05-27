/// @description Insert description here
// You can write your code in this editor

if drawText {
	draw_set_colour(c_white);
	pointMarker = instance_find(oPointMarker, 2)
	draw_text(pointMarker.x, pointMarker.y, atkName);
	
	if (attackMessage != "") {
		draw_text(attackMessage_x, attackMessage_y, attackMessage);
	}
}