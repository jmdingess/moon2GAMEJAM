/// @description Insert description here
// You can write your code in this editor

var mouse;
mouse = mouse_check_button_pressed(mb_left);

// If we aren't selected and the mouse clicks and the mouse is over us
if (invalid == false && global.attackSelected != id && mouse && position_meeting(mouse_x, mouse_y, self.id))
{
	global.attackSelected = id;
	// Put the selection box over us
	var selectionBox;
	selectionBox = instance_find(oSelectionBox, 0)
	if (selectionBox != noone) {
		selectionBox.x = self.x;
		selectionBox.y = self.y;
		selectionBox.visible = true; 
	}
	
	// Highlight possible targets
	
	var enemyTargets = attackMap[? "targetPosition"];
	if is_undefined(enemyTargets) {
		enemyTargets = [0, 0, 0, 0];
	}
	var allyTargets = attackMap[? "targetAllyPosition"];
	if is_undefined(allyTargets) {
		allyTargets = [0, 0, 0, 0];
	}
	targettingType = attackMap[? "type"];
	if (is_undefined(targettingType)) {
		targettingType = targetting.TARGET;
	}
	var targetDead = attackMap[? "targetDead"];
	if (is_undefined(targetDead)) {
		targetDead = false;
	}
	var position = global.selected.myID;
	var i;
	
	if targettingType == targetting.TARGETNEIGHBORS {
		targettingType = targetting.TARGET;
		for (i=0; i < 4; i++) {
			if (i == position +1 or i == position-1) {
				allyTargets[i] = 1;
			}
			else {
				allyTargets[i] = 0;
			}
		}
	}
	if targettingType == targetting.TARGETSELF {
		targettingType = targetting.TARGET;
		allyTargets = [0, 0, 0, 0];
		allyTargets[position] = 1;
	}
	
	for (i=0; i < array_length_1d(enemies) && i < array_length_1d(enemyTargets); i++) {
		// if enemy is alive (decided by their sprite existing)
		if ((targetDead || (enemies[i].sprite_index != -1 && enemies[i].sprite_index != sEmptyChar) ) && enemyTargets[i] == 1) {
			// Highlight this enemy
			possibleTargets[i].visible = true;
			possibleTargets[i].sprite_index = sPossibleTarget;
			enemies[i].isTargetable = true;
		}
		else {
			possibleTargets[i].visible = false;
			possibleTargets[i].sprite_index = sPossibleTarget;
			enemies[i].isTargetable = false;
		}
	}
	for (i=0; i < array_length_1d(characters) && i < array_length_1d(allyTargets); i++) {
		// if character is alive (decided by their sprite existing)
		if ((targetDead || (characters[i].sprite_index != -1 && characters[i].sprite_index != sEmptyChar) ) && allyTargets[i] == 1) {
			// Highlight this character
			possibleTargets[4 + i].visible = true;
			possibleTargets[4 + i].sprite_index = sPossibleTarget;
			characters[i].isTargetable = true;
		}
		else {
			possibleTargets[4 + i].visible = false;
			possibleTargets[4 + i].sprite_index = sPossibleTarget;
			characters[i].isTargetable = false;
		}
	}
	
}

// Once the target has been chosen, do attack
if (doAttack == true && global.attackSelected == id) {
	doAttack = false;
	
	var character = global.selected.myCharacter;
	if is_undefined(character) {
		show_error("Could not find character", true);
	}
	
	show_debug_message(attackMap[? "displayName"]);
	var attackID = attackMap[? "id"];
	if (is_undefined(attackID)) {
		show_error("Could not find attackID", true);
	}
	
	var attackPower = attackMap[? "power"];
	if (is_undefined(attackPower)) {
		attackPower = 1;
	}
	
	// do Attack
	do_attack(character, target, attackID, attackPower);
	
	// show attack; will pass turn for us
	var gameManager = instance_find(oGameplayTurnManagement, 0)
	if (is_undefined(gameManager)) {
		show_error("Could not get game manager", true);
	}
	else {
		gameManager.target = target;
		gameManager.atkSprite = attackMap[? "atkSprite"];
		gameManager.atkName = attackMap[? "displayName"];
		gameManager.showAttack = true;
	}
}