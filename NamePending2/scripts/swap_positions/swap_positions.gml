// PG-13 Username
//@desc swap_positions(instance1, instance2)
// Swaps positions, preserves conditions and turn order

var inst1 = argument0;
var inst2 = argument1;

var pos1 = inst1.myID;
var pos2 = inst2.myID;

var turn1 = arr_find(global.turnOrder, inst1);
var turn2 = arr_find(global.turnOrder, inst2);

// Swap turn order of the instances so the same characters have the same turn (characters != instances)
if (turn1 != -1 and turn2 != -1) {
	global.turnOrder[turn1] = inst2;
	global.turnOrder[turn2] = inst1;
}
else {
	if (turn1 == -1) {
		global.turnOrder[turn2] = inst1;
	}
	else {
		global.turnOrder[turn1] = inst2;
	}
}

if (inst1.object_index == oCharacter) {
	// Character swapping
	
	// Swap ordering of characters
	var tmp = global.order[pos1];
	global.order[pos1] = global.order[pos2];
	global.order[pos2] = tmp;
	
	// Give new charMaps to the characters
	var tmp = ds_map_create();
	ds_map_copy(tmp, inst1.myCharacter);
	ds_map_copy(inst1.myCharacter, inst2.myCharacter);
	ds_map_copy(inst2.myCharacter, tmp);
}
else {
	// Enemy swapping
	
	// Swap ordering of characters
	var tmp = global.enemyOrder[pos1];
	global.enemyOrder[pos1] = global.enemyOrder[pos2];
	global.enemyOrder[pos2] = tmp;
	
	// give new enemy maps to the enemies
	var tmp = ds_map_create();
	ds_map_copy(tmp, inst1.enemyMap);
	ds_map_copy(inst1.enemyMap, inst2.enemyMap);
	ds_map_copy(inst2.enemyMap, tmp);
	
}

// TODO: Swap any conditions (poisoned, etc) that we apply
var tmp = inst1.dead;
inst1.dead = inst2.dead;
inst2.dead = tmp;

var tmp = inst1.current_hp;
inst1.current_hp = inst2.current_hp;
inst2.current_hp = tmp;

var tmp = inst1.charge;
inst1.charge = inst2.charge;
inst2.charge = tmp;

var tmp = inst1.stun;
inst1.stun = inst2.stun;
inst2.stun = tmp;

var tmp = inst1.riposte;
inst1.riposte = inst2.riposte;
inst2.riposte = tmp;

var tmp = inst1.bleed;
inst1.bleed = inst2.bleed;
inst2.bleed = tmp;

var tmp = inst1.shield;
inst1.shield = inst2.shield;
inst2.shield = tmp;