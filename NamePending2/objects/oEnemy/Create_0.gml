/// @description Insert description here
// You can write your code in this editor

enemies[0] = ds_map_create();
enemies[1] = ds_map_create();
enemies[2] = ds_map_create();
enemies[3] = ds_map_create();
enemies[4] = ds_map_create();




// Find my ID by order in which we are listed in room
var i = 0;
while (instance_find(oEnemy, i) != self.id)
{
	i++;
}
myID = i;
enemyMap = enemies[global.enemyOrder[myID]];