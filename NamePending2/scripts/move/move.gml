// PG-13 Username
// @desc move(character, numSpaces)
// moves character numSpaces forward, or back if numSpaces is negative.
// character must be the instance

var character = argument0;
var numSpaces = argument1;
var charPos = character.myID;

// Don't move forward if already in front; don't move back if already in back
// Also, only move forward 1 if trying to move up 2 from position just before front, etc
numSpaces = charPos - clamp(charPos-numSpaces, 0, 4)
if (numSpaces == 0) {
	return;
}
var dir = sign(numSpaces);

var others;
var i;
if (character.object_index == oCharacter) {
	for (i = 0; i < 4; i++) {
		others[i] = instance_find(oCharacter, i);
	}
}
else {
	for (i = 0; i < 4; i++) {
		others[i] = instance_find(oEnemy, i);
	}
}

while (numSpaces != 0) {
	swap_positions(others[charPos], others[charPos-dir]);
	charPos -= dir;
	numSpaces -= dir;
}