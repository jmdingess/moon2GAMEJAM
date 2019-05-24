/// @description Insert description here
// You can write your code in this editor

// Find my ID by order in which we are listed in room
var i = 0;
while (instance_find(oCharacter, i) != self.id)
{
	i++;
}
myID = i;
myCharacter = global.characters[global.order[myID]];

// Create an array listing the attack buttons for use later
var i = -1;
for (i = 0; i < instance_number(oAttack); i++) {
	attackButtons[i] = instance_find(oAttack, i);
}