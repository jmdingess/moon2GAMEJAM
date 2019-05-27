/// @description Insert description here
// You can write your code in this editor

var mouse = mouse_check_button_pressed(mb_left);
var esc = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_pause));

// Code for showing attackAnimations
if (showAttack) {
	showAttack = false;
	
	if (!is_undefined(atkSprite) and atkSprite != -1) {
		var charMap = -1;
		if (global.selected.object_index = oCharacter) {
			charMap = global.selected.myCharacter;
		}
		else {
			charMap = global.selected.enemyMap;
		}
		if (is_undefined(charMap) or charMap == -1) {
			show_debug_message("Couldn't fetch character map");
		}
		else {
			oldSprite = charMap[? "sprite"]
			if (is_undefined(oldSprite)) {
				show_debug_message("Couldn't fetch sprite");
			}
			else {
				charMap[? "sprite"] = atkSprite;
				global.selected.sprite_index = atkSprite;
				show_debug_message("Changed attack sprite")
			}
		}
	}
	
	targetMap = -1;
	if (global.selected.object_index = oCharacter) {
		targetMap = global.selected.myCharacter;
	}
	else {
		targetMap = global.selected.enemyMap;
	}
	if (is_undefined(targetMap) or targetMap == -1) {
		show_debug_message("Couldn't fetch target map");
	}
	else {
		var hitSprite = targetMap[? "hit"];
		if (!is_undefined(hitSprite)) {
			oldTargetSprite = targetMap[? "sprite"];
			targetMap[? "sprite"] = hitSprite;
			target.sprite_index = hitSprite;
		}
		else {
			oldTargetSprite = -1;
		}
	}
	
	// Display name of attack at top of screen; see draw code
	drawTopText = true;
	
	// Wait 0.8 seconds; continue at alarm 0 code
	alarm[0] = 0.8*room_speed;
}

// If they click on nothing, deselect attacks
if (mouse && !position_meeting(mouse_x, mouse_y, oCharacter) && !position_meeting(mouse_x, mouse_y, oEnemy) && !position_meeting(mouse_x, mouse_y, oAttack)) {
	show_debug_message("I'm deselecting!");
	global.attackSelected = -1;
	//global.selected = -1;
	var selectionBox = instance_find(oSelectionBox, 0);
	if (selectionBox != noone) {
		selectionBox.visible = false;
	}
	//var selectionBar = instance_find(oSelectionBar, 0);
	//if (selectionBar != noone) {
	//	selectionBar.visible = false;
	//}
	var i;
	//for (i = 0; i < instance_number(oInvalidAttack); i++) {
	//	var invalidAttack = instance_find(oInvalidAttack, i);
	//	invalidAttack.visible = false;
	//}
	//for (i = 0; i < instance_number(oAttack); i++) {
	//	var invalidAttack = instance_find(oAttack, i);
	//	invalidAttack.visible = false;
	//}
	for (i = 0; i < instance_number(oPossibleTarget); i++) {
		var possibleTarget = instance_find(oPossibleTarget, i);
		possibleTarget.visible = false;
	}
}

if (esc) {
	// Should pause, but...
	game_end();
}

// Highlight Target arrows on mouse over
if (global.attackSelected != -1 and (position_meeting(mouse_x, mouse_y, oEnemy) or position_meeting(mouse_x, mouse_y, oCharacter) or position_meeting(mouse_x, mouse_y, oPossibleTarget)) ) {
	var targetType = global.attackSelected.targettingType;
	
	var i;
	for (i=0; i < array_length_1d(possibleTargets); i++) {
		possibleTargets[i].sprite_index = sPossibleTarget;
	}
	
	var inst = instance_position(mouse_x, mouse_y, oEnemy);
	var pos = -1;
	if (inst != noone) {
		pos = inst.myID;
	}
	else {
		inst = instance_position(mouse_x, mouse_y, oCharacter);
		if (inst != noone) {
			pos = inst.myID + 4;
		}
		else {
			inst = instance_position(mouse_x, mouse_y, oPossibleTarget);
			for (i = 0; i < array_length_1d(possibleTargets); i++) {
				if (inst == possibleTargets[i]) {
					pos = i;
				}
			}
		}
	}
	
	switch (targetType) {
	case targetting.TARGETANY:
	case targetting.TARGETALL:
	case targetting.SPECIAL:
		var i;
		for (i=0; i < array_length_1d(possibleTargets); i++) {
			possibleTargets[i].sprite_index = sPossibleTargetHighlight;
		}
		break;
	case targetting.TARGETTHREE:
		if (pos+2 % 4 != 1 and pos+2 % 4 != 0) {
			possibleTargets[pos+2].sprite_index = sPossibleTargetHighlight;
		}
	case targetting.TARGETTWO:
		if (pos+1 % 4 != 0) {
			possibleTargets[pos+1].sprite_index = sPossibleTargetHighlight;
		}
	case targetting.TARGET:
	case targetting.TARGETSELF:
	case targetting.TARGETNEIGHBORS:
		possibleTargets[pos].sprite_index = sPossibleTargetHighlight;
	}
}