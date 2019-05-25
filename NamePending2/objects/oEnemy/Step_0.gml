/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

// If not prepping an attack and not selected and mouse clicked and mouse is over us; i.e. If they clicked us
if (global.attackSelected = -1 && global.enemySelected != id && mouse && position_meeting(mouse_x, mouse_y, id))
{
	global.enemySelected = id;
	// Put the selection bar over us
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.visible = true; 
	}
}

if  (MAXDRIFT < abs(y - origin)) {
	driftDirection = -driftDirection;
	y = origin - sign(driftDirection)*MAXDRIFT;
	vspeed = driftDirection;
}