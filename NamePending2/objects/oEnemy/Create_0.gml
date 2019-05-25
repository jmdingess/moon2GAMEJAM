/// @description Insert description here
// You can write your code in this editor

enemies[0] = ds_map_create();
enemies[1] = ds_map_create();
enemies[2] = ds_map_create();
enemies[3] = ds_map_create();
ds_map_add(enemies[3], "sprite", sMoon2VeryA);
enemies[4] = ds_map_create();




// Find my ID by order in which we are listed in room
var i = 0;
while (instance_find(oEnemy, i) != self.id)
{
	i++;
}
myID = i;
enemyMap = enemies[global.enemyOrder[myID]];

// Drift up and down
MAXDRIFT = 5;
origin = y;
driftDirection = random_range(-1, 1);
vspeed = driftDirection;