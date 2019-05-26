// PG-13 Username
//@desc swap_positions(instance1, instance2)
// Swaps positions, preserves conditions and turn order

var inst1 = argument0;
var inst2 = argument1;

var pos1 = inst1.myID;
var pos2 = inst2.myID;

var turn1 = arr_find(global.turnOrder, inst1);
var turn2 = arr_find(global.turnOrder, inst2);

// Swap turn order
global.turnOrder[turn1] = inst2;
global.turnOrder[turn2] = inst1;

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

// Swap their local tracking of position
inst1.myID = pos2;
inst2.myID = pos1;

// TODO: Swap any conditions (poisoned, etc) that we apply