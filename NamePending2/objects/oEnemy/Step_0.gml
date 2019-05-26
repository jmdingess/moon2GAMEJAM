/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

// On our turn
if (global.selected == id && global.newSelect == true)
{
	global.newSelect = false;
	
	// Put the selection bar over us
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.visible = true; 
	}
	
	// Take Action
	show_debug_message("I growl menacingly!");
	
	// Pass turn
	global.turn++;
	if global.turn >= array_length_1d(global.turnOrder) {
		global.turn = 0;
	}
	global.selected = global.turnOrder[global.turn];
	global.newSelect = true;
}

// If we get clicked on while we are a valid target for an attack; i.e. they attack us.
if (global.attackSelected != -1 && isTargetable == true && mouse && position_meeting(mouse_x, mouse_y, id)) {
	global.attackSelected.doAttack = true;
	global.attackSelected.target = id;
}

if  (MAXDRIFT < abs(y - origin)) {
	driftDirection = -driftDirection;
	y = origin - sign(driftDirection)*MAXDRIFT;
	vspeed = driftDirection;
}