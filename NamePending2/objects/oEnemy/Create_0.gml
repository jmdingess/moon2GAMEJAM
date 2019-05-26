/// @description Insert description here
// You can write your code in this editor

// set my oAttack
isTargetable = false;

// Find my ID by order in which we are listed in room
var i = 0;
while (instance_find(oEnemy, i) != self.id)
{
	i++;
}
myID = i;
enemyMap = ds_map_create();
ds_map_copy(enemyMap, global.enemies[global.enemyOrder[myID]]);

// Drift up and down
MAXDRIFT = 5;
origin = y;
driftDirection = random_range(-1, 1);
vspeed = driftDirection;