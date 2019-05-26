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
myID = i;
enemyMap = ds_map_create();
ds_map_copy(enemyMap, global.enemies[global.enemyOrder[myID]]);
dead = false;

// Drift up and down
MAXDRIFT = 5;
origin = y;
driftDirection = random_range(-1, 1);
vspeed = driftDirection;