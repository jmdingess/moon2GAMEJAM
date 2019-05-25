/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

// If not selected and mouse clicked and mouse is over us; i.e. If they clicked us
if (global.selected != myID && mouse && position_meeting(mouse_x, mouse_y, id))
{
	global.selected = myID;
	// Put the selection bar over us
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.y = self.y;
		selectionBar.visible = true; 
	}
	
	// Make the attack buttons visible and change them to the right sprites
	// Also, add the ID of the attack; the attack button will use this to decide what to do.
	myAttacks = myCharacter[? "attacks"];
	var i = -1;
	for (i = 0; i < array_length_1d(attackButtons); i++) { 
		attackButtons[i].myID = ds_map_find_value(myAttacks[i], "id");
		attackButtons[i].sprite_index = ds_map_find_value(myAttacks[i], "sprite");
		attackButtons[i].visible = true;
	}
}