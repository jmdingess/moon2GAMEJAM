/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

// If not selected and mouse clicked and mouse is over us; i.e. If they clicked us
if (global.selected != id && mouse && position_meeting(mouse_x, mouse_y, id))
{
	global.selected = id;
	// Put the selection bar over us
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.visible = true; 
	}
	
	// Make the attack buttons visible and change them to the right sprites
	// Also, add the ID of the attack; the attack button will use this to decide what to do.
	var myAttacks = myCharacter[? "attacks"];
	var i = -1;
	for (i = 0; i < array_length_1d(attackButtons); i++) {
		show_debug_message(myAttacks);
		var attackMap = myAttacks[| i];
		var charPosition = attackMap[? "charPosition"]
		if (charPosition[3-myID] != 1) {
			// Invalid
			invalidAttackOverlays[i].visible = true;
			attackButtons[i].invalid = true;
		}
		else {
			// Valid
			invalidAttackOverlays[i].visible = false;
			attackButtons[i].invalid = false;
		}
		attackButtons[i].sprite_index = ds_map_find_value(attackMap, "sprite");
		attackButtons[i].charID = myID;
		attackButtons[i].attackMap = attackMap;
		attackButtons[i].visible = true;
	}
	// Deselect selected attack
	var selectionBox = instance_find(oSelectionBox, 0);
	selectionBox.visible = false;
	global.attackSelected = -1;
	global.enemySelected = -1;
	for (i = 0; i < array_length_1d(possibleTargets); i++) {
		possibleTargets[i].visible = false;
	}
}

if  (MAXDRIFT < abs(y - origin)) {
	driftDirection = -driftDirection;
	y = origin - sign(driftDirection)*MAXDRIFT;
	vspeed = driftDirection;
}