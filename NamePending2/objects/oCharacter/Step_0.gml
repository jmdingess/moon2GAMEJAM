/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

//if we are in party selection room
//add us to global.order
if(mouse && room == selectRoom && position_meeting(mouse_x, mouse_y, self.id))
{
	//if charList has an open slot
	
}

// When our turn begins
if (global.selected = id && global.newSelect == true)
{
	global.newSelect = false;
	
	// Put the selection bar over us
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.visible = true; 
	}
	
	var i;
	for (i = 0; i < array_length_1d(statBoosts); i++) {
		if statBoosts[i] != 0 {
			myStats[i] -= sign(statBoosts[i]);
			statBoosts[i] -= sign(statBoosts[i]);
		}
	}
	
	if (riposte >= 0) {
		riposte -= 1;
	}
	if (shield >= 0) {
		shield -= 1;
	}
	
	if (bleed >= 0) {
		current_hp -= bleed;
		bleed -= 1;
	}
	
	if (current_hp <= 0) {
		dead = true;
		die(id);
		
		// Pass turn
		global.turn++;
		if global.turn >= global.turnOrderSize {
			global.turn = 0;
		}
		global.selected = global.turnOrder[global.turn];
		global.newSelect = true;
	}
	else {
		if (stun != 0) {
			// Stunned
			stun -= 1;
		
			// show attack; will pass turn for us
			var gameManager = instance_find(oGameplayTurnManagement, 0)
			if (is_undefined(gameManager)) {
				show_error("Could not get game manager", true);
			}
			else {
				gameManager.target = id;
				gameManager.atkSprite = -1;
				gameManager.atkName = "Stunned"
				gameManager.showAttack = true;
			}
		}
	
		// Make the attack buttons visible and change them to the right sprites
		// Also, add the ID of the attack; the attack button will use this to decide what to do.
		var myAttacks = myCharacter[? "attacks"];
		var i = -1;
		for (i = 0; i < array_length_1d(attackButtons); i++) {
			var attackMap = myAttacks[| i];
			var charPosition = attackMap[? "charPosition"]
			if (is_undefined(charPosition)) {
				show_debug_message("Something has gone wrong - charPosition doesn't exist")
				charPosition = [1, 1, 1, 1] // Let them do it
			}
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
		moveButton.invalid = false;
		moveButton.charID = myID;
		moveButton.attackMap = global.movementMap;
		moveButton.visible = true;
		// Deselect selected attack
		var selectionBox = instance_find(oSelectionBox, 0);
		selectionBox.visible = false;
		global.attackSelected = -1;
		for (i = 0; i < array_length_1d(possibleTargets); i++) {
			possibleTargets[i].visible = false;
		}
	}
}

// When we are selected as the target of an attack
if (global.attackSelected != -1 && isTargetable == true && mouse && position_meeting(mouse_x, mouse_y, id)) {
	global.attackSelected.doAttack = true;
	global.attackSelected.target = id;
}

if  (MAXDRIFT < abs(y - origin)) {
	driftDirection = -driftDirection;
	y = origin - sign(driftDirection)*MAXDRIFT;
	vspeed = driftDirection;
}