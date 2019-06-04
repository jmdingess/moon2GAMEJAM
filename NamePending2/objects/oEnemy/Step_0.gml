/// @description Insert description here
// You can write your code in this editor

// Get Mouse
var mouse;
mouse = mouse_check_button_pressed(mb_left);

// Reset current_hp if it's too much
if (current_hp > max_hp) {
	current_hp = max_hp;
}

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
	
	var i;
	for (i = 0; i < array_length_1d(statBoosts); i++) {
		if statBoosts[i] != 0 {
			myStats[i] -= sign(statBoosts[i]);
			statBoosts[i] -= sign(statBoosts[i]);
		}
	}
	
	if (charge > 0) {
		charge -= 1;
	}
	
	if (riposte > 0) {
		riposte -= 1;
	}
	
	if (shield > 0) {
		shield -= 1;
	}
	
	if (bleed > 0) {
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
			// We are stunned
			stun -= 1;
		
			// Needed to pass turn
			var target = id;
			var attackMap = ds_map_create();
			ds_map_add(attackMap, "displayName", "Stunned");
		}
		else {
	
			// Take Action
	
			// Decide on a weighted random attack
			var possibleAttacks = enemyMap[? "attacks"];
			if (is_undefined(possibleAttacks)) {
				show_error("No attacks found", true);
			}
			var numAttacks = ds_list_size(possibleAttacks);
			var weightedAttacks = [];
			var totalWeight = 0;
			var special = -1;
			var i;
			for (i = 0; i < numAttacks; i++) {
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
					var enemyID = enemyMap[? "id"];
					if (enemyID == 12) {
						// Corporate
						// Use every four turns
						if (charge == 0) {
							special = i;
							charge = 3;
						}
					}
					if (enemyID == 13) {
						// Ricardo Milos
						// Use every four turns
						if (charge == 0) {
							special = i;
							charge = 3;
						}
					}
					continue;
				}
				// Has to be a legal attack
				var charPosition = attackMap[? "charPosition"];
				if (is_undefined(charPosition)) {
					show_debug_message("enemy " + enemyMap[? "displayName"] + " has no charPosition for attack " + attackMap[? "name"]);
					charPosition = [1, 1, 1, 1];
				}
				if (charPosition[3-myID] == 0) {
					//show_debug_message("Not standing in right spot");
					// Not standing in right spot
					continue;
				}
				// Ensure there exists a legal target
				var targetPosition = attackMap[? "targetPosition"];
				if (is_undefined(targetPosition)) {
					targetPosition = [0, 0, 0, 0];
				}
				var targetAllyPosition = attackMap[? "targetAllyPosition"];
				if (is_undefined(targetAllyPosition)) {
					targetAllyPosition = [0, 0, 0, 0];
				}
				if (type == targetting.TARGETSELF) {
					targetAllyPosition[3-myID] = 1;
				}
				var j;
				if (type == targetting.TARGETNEIGHBORS) {
					for (j = 0; j < 4; j++) {
						if (j == (3-myID)+1 or j == (3-myID)-1) {
							targetAllyPosition[j] = 1;
						}
						else {
							targetAllyPosition[j] = 0;
						}
					}
				}
				if (type == targetting.SPECIAL) {
					targetAllyPosition[3-myID] = 1;
				}
				// TargetDead on a monster = MUST target dead. this is different from on characters (CAN target dead)
				var targetDead = attackMap[? "targetDead"];
				if (is_undefined(targetDead)) {
					targetDead = false;
				}
				var targetExists = false;
				for (j=0; j < 4; j++) {
					if (targetPosition[j] == 1) {
						if (targetDead == characters[j].dead) {
							targetExists = true;
							break;
						}
					}
					if (targetAllyPosition[3-j] == 1 and targetDead == enemies[j].dead) {
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
					//show_debug_message("No legal targets found");
				}
			}
	
			if (totalWeight == 0) {
				show_debug_message("No legal attacks for " + enemyMap[? "displayName"]);
		
				// Needed to pass turn
				var target = id;
				var attackMap = ds_map_create();
				ds_map_add(attackMap, "displayName", "Pass");
			}
			else {
				// Select attack
				var attack = -1;
				if (special == -1) {
					var attack = weightedAttacks[irandom_range(0, totalWeight-1)];
				}
				else {
					// Always select special attack if there is one available
					var attack = special;
				}
		
				// Now select target
				var attackMap = possibleAttacks[|attack];
				var targetPosition = attackMap[? "targetPosition"];
				if (is_undefined(targetPosition)) {
					targetPosition = [0, 0, 0, 0];
				}
				var targetAllyPosition = attackMap[? "targetAllyPosition"];
				if (is_undefined(targetAllyPosition)) {
					targetAllyPosition = [0, 0, 0, 0];
				}
				var type = attackMap[? "type"];
				if (type == targetting.TARGETSELF) {
					targetAllyPosition[3-myID] = 1;
				}
				if (type == targetting.TARGETNEIGHBORS) {
					for (i = 0; i < 4; i++) {
						if (i == (3-myID)+1 or i == (3-myID)-1) {
							targetAllyPosition[i] = 1;
						}
						else {
							targetAllyPosition[i] = 0;
						}
					}
				}
				if(type == targetting.SPECIAL) // just for Ricardo rn
				{
					targetAllyPosition[3-myID] = 1;	
				}
				// TargetDead on a monster = MUST target dead. this is different from on characters (CAN target dead)
				var possibleTargets = -1; //no relation to oPossibleTarget
				var numTargets = 0;
				for (i=0; i < 4; i++) {
					if (targetPosition[i] == 1) {
						if (targetDead == characters[i].dead) {
							possibleTargets[numTargets] = i;
							numTargets++;
						}
					}
					if (targetAllyPosition[3-i] == 1 and targetDead == enemies[i].dead) {
						possibleTargets[numTargets] = 4+i;
						numTargets++;
					}
				}
				if (possibleTargets == -1) {
					show_debug_message("No possible targets even though we checked for this...")
				}
				else
				{
					var targetNo = possibleTargets[irandom_range(0, numTargets-1)];
					var target = -1;
					if targetNo >= 4 {
						target = enemies[targetNo-4];
					}
					else {
						target = characters[targetNo];
					}
					var attackPower = attackMap[? "power"];
					if (is_undefined(attackPower)) {
						attackPower = 1;
					}
	
					//do attack
					do_attack(enemyMap, target, attackMap[? "id"], attackPower);
					show_debug_message(attackMap[? "displayName"]);
				}
			}
		}

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
}

// If we get clicked on while we are a valid target for an attack; i.e. they attack us.
if (global.attackSelected != -1 && isTargetable == true && mouse && position_meeting(mouse_x, mouse_y, id)) {
	global.attackSelected.doAttack = true;
	global.attackSelected.target = id;
	var tempStats = enemyMap[? "stats"];
	if(tempStats[0] < 0)
	{
		targetDead = true;
		show_debug_message(enemyMap[? "displayName"] + " is dead");
	}
}


if  (MAXDRIFT < abs(y - origin)) {
	driftDirection = -driftDirection;
	y = origin - sign(driftDirection)*MAXDRIFT;
	vspeed = driftDirection;
}