/// @description Insert description here
// You can write your code in this editor

// Set by the oCharacter code
charID = -1;
myID = -1;
attackMap = -1;
invalid = true;

// Create an array listing the enemies for use later
var i = -1;
for (i = 0; i < instance_number(oEnemy); i++) {
	enemies[i] = instance_find(oEnemy, i);
}