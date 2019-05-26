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
	
	// Decide on a weighted random attack
	var possibleAttacks = enemyMap[? "attacks"];
	if (is_undefined(possibleAttacks)) {
		show_error("No attacks found", true);
	}
	show_debug_message(possibleAttacks);
	var numAttacks = ds_list_size(possibleAttacks);
	var weightedAttacks = [];
	var totalWeight = 0;
	var special = -1;
	var i;
	for (i = 0; i < numAttacks; i++) {
		show_debug_message("attack " + string(i));
		
		var attackMap = possibleAttacks[|i];
		var weight = attackMap[? "weight"];
		if (is_undefined(weight)) {
			show_debug_message("enemy " + enemyMap[? "displayName"] + " has no weight for attack " + attackMap[? "name"]);
			weight = 1;
		}
		var type = attackMap[? "type"];
		if (is_undefined(type)) {
			type = targetting.TARGET;
		}
		if (type == targetting.SPECIAL) {
			special = i;
			continue;
		}
		// Has to be a legal attack
		var charPosition = attackMap[? "charPosition"];
		if (is_undefined(charPosition)) {
			show_debug_message("enemy " + enemyMap[? "displayName"] + " has no charPosition for attack " + attackMap[? "name"]);
			charPosition = [1, 1, 1, 1];
		}
		if (charPosition[3-myID] == 0) {
			show_debug_message("Not standing in right spot");
			// Not standing in right spot
			continue;
		}
		// Ensure there exists a legal target
		var targetPosition = attackMap[? "targetPosition"];
		if (is_undefined(targetPosition)) {
			targetPosition = [0, 0, 0, 0];
		}
		var targetAllyPosition = attackMap[? "targetPosition"];
		if (is_undefined(targetAllyPosition)) {
			targetAllyPosition = [0, 0, 0, 0];
		}
		if (type = targetting.TARGETSELF) {
			targetAllyPosition[3-myID] = 1;
		}
		if (type = targetting.TARGETNEIGHBORS) {
			for (i = 0; i < 4; i++) {
				if (i == (3-myID)+1 or i == (3-myID)-1) {
					targetAllyPosition[i] = 1;
				}
				else {
					targetAllyPosition[i] = 0;
				}
			}
		}
		// TargetDead on a monster = MUST target dead. this is different from on characters (CAN target dead)
		var targetDead = attackMap[? "targetDead"];
		if (is_undefined(targetDead)) {
			targetDead = false;
		}
		var targetExists = false;
		for (i=0; i < 4; i++) {
			if (targetPosition[i] == 1) {
				if (targetDead != characters[i].dead) {
					targetExists = true;
					break;
				}
			}
			if (targetAllyPosition[3-i] == 1 and targetDead != enemies[i].dead) {
				targetExists = true;
				break;
			}
		}
		if (targetExists) {
			repeat(weight) {
				weightedAttacks[totalWeight] = i;
				totalWeight++;
			}
		}
		else { 
			show_debug_message("No legal targets found");
		}
	}
	
	if (totalWeight == 0) {
		show_debug_message("No legal attacks for " + enemyMap[? "displayName"]);
	}
	else {
		// Select attack
		if (special == -1) {
			var attackNo = weightedAttacks[irandom_range(0, totalWeight-1)];
			var attack = possibleAttacks[|attackNo];
		}
		else {
			// Always select special attack if there is one; needs to be changed later
			var attack = special;
		}
	
		// Now select target
		var attackMap = possibleAttacks[|attack];
		var targetPosition = attackMap[? "targetPosition"];
		if (is_undefined(targetPosition)) {
			targetPosition = [0, 0, 0, 0];
		}
		var targetAllyPosition = attackMap[? "targetPosition"];
		if (is_undefined(targetAllyPosition)) {
			targetAllyPosition = [0, 0, 0, 0];
		}
		if (type = targetting.TARGETSELF) {
			targetAllyPosition[3-myID] = 1;
		}
		if (type = targetting.TARGETNEIGHBORS) {
			for (i = 0; i < 4; i++) {
				if (i == (3-myID)+1 or i == (3-myID)-1) {
					targetAllyPosition[i] = 1;
				}
				else {
					targetAllyPosition[i] = 0;
				}
			}
		}
		// TargetDead on a monster = MUST target dead. this is different from on characters (CAN target dead)
		var targetDead = attackMap[? "targetDead"];
		if (is_undefined(targetDead)) {
			targetDead = false;
		}
		var possibleTargets; //no relation to oPossibleTarget
		var numTargets = 0;
		for (i=0; i < 4; i++) {
			if (targetPosition[i] == 1) {
				if (targetDead != characters[i].dead) {
					possibleTargets[numTargets] = i;
					numTargets++;
				}
			}
			if (targetAllyPosition[3-i] == 1 and targetDead != enemies[i].dead) {
				possibleTargets[numTargets] = 4+i;
				numTargets++;
			}
		}
		var targetNo = possibleTargets[irandom_range(0, numTargets-1)];
		var target = -1;
		if targetNo >= 4 {
			target = enemies[targetNo-4];
		}
		else {
			target = characters[targetNo];
		}
	
		//do attack
		do_attack(enemyMap, target, attackMap[? "id"])
		show_debug_message(attackMap[? "displayName"]);
	}
	
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