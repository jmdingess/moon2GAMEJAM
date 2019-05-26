/// @description Insert description here
// You can write your code in this editor

// Set by oAttack
isTargetable = false;

// Find my position by order in which we are listed in room
var i = instance_number(oCharacter) - 1;
while (instance_find(oCharacter, i) != self.id && 0 < i)
{
	i--;
}
myID = i;
myCharacter = global.characters[global.order[myID]];

// Create an array listing the attack buttons for use later
var i = -1;
for (i = 0; i < instance_number(oAttack); i++) {
	attackButtons[i] = instance_find(oAttack, i);
}

// Create an array listing the attack invalid overlays for use later
var i = -1;
for (i = 0; i < instance_number(oInvalidAttack); i++) {
	invalidAttackOverlays[i] = instance_find(oInvalidAttack, i);
}

// Create an array listing the possible target icons for use later
var i = -1;
for (i = 0; i < instance_number(oPossibleTarget); i++) {
	possibleTargets[i] = instance_find(oPossibleTarget, i);
}

// Drift up and down
MAXDRIFT = 5;
origin = y;
driftDirection = random_range(-1, 1);
vspeed = driftDirection;