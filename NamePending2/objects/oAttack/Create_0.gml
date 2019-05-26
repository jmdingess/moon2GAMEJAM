/// @description Insert description here
// You can write your code in this editor

targettingType = -1;

// Set by the oCharacter code
charID = -1;
myID = -1;
attackMap = -1;
invalid = true;

// Set by oEnemy
doAttack = false;
target = -1;

// Create an array listing the characters for use later
var i = -1;
for (i = 0; i < instance_number(oCharacter); i++) {
	characters[i] = instance_find(oCharacter, i);
}

// Create an array listing the enemies for use later
for (i = 0; i < instance_number(oEnemy); i++) {
	enemies[i] = instance_find(oEnemy, i);
}

// Create an array listing the possible target arrows for use later
for (i = 0; i < instance_number(oPossibleTarget); i++) {
	possibleTargets[i] = instance_find(oPossibleTarget, i);
}