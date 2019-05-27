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
myCharacter = ds_map_create();
ds_map_copy(myCharacter, global.characters[global.order[myID]])
myStats = myCharacter[? "stats"]

// attributes
stun = 0;
charge = 0;
current_hp = myStats[0];
dead = false;

// Create an array listing the attack buttons for use later
var i = -1;
var numButtons = 0;
for (i = 0; i < instance_number(oAttack); i++) {
	var button = instance_find(oAttack, i);
	if button.object_index != oMove {
		attackButtons[numButtons] = button;
		numButtons++;
	}
	else {
		moveButton = button;
	}
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