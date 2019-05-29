/// @description Insert description here
// You can write your code in this editor

// set my oAttack
isTargetable = false;

// Create an array listing the characters for use later
var i = -1;
for (i = 0; i < instance_number(oCharacter); i++) {
	characters[i] = instance_find(oCharacter, i);
}

// Create an array listing the enemies for use later
for (i = 0; i < instance_number(oEnemy); i++) {
	enemies[i] = instance_find(oEnemy, i);
}


// Find my ID by order in which we are listed in room
var i = 0;
while (instance_find(oEnemy, i) != self.id)
{
	i++;
}
myID = i; // better name for this is myPos
occupiedBy = -1; // -1 = no one is occupying this square by being wide
enemyMap = ds_map_create();
if (global.enemyOrder[myID] == -1) {
	// -1 denotes another character is big and 'sitting' in this slot
	ds_map_copy(enemyMap, global.enemies[0]);
	i = 0;
	while (0 <= myID - i and global.enemyOrder[myID-i] == -1) {
		i++;
	}
	if (myID - i) > 0 {
		occupiedBy = instance_find(oEnemy, myID - i);
	}
	else {
		// This is a pretty huge error and shouldn't happen
		show_debug_message("Initialization of character with -1 value can't continue");
		// Use empty instead; could cause glitches though
		occupiedBy = -1;
	}
}
else {
	ds_map_copy(enemyMap, global.enemies[global.enemyOrder[myID]]);
}
myStats = enemyMap[? "stats"];

// Attributes
max_hp = myStats[0];
stun = 0;
charge = 0;
current_hp = myStats[0];
dead = false;
riposte = 0;
bleed = 0;
shield = 0;
statBoosts = [0, 0, 0, 0, 0, 0, 0, 0, 0];

if (enemyMap[? "id"] == 0) {
	dead = true;
}

// Drift up and down
MAXDRIFT = 5;
origin = y;
driftDirection = random_range(-1, 1);
vspeed = driftDirection;