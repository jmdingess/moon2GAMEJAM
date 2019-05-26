// PG-13 Username, <your name here>
// @desc do_attack(character, target, attackID)
// Does attack. Called from oAttack->Step

// charMap is the map of the character that called it. Should be same as global.selected.myCharacter
// target is the instance (oCharacter or oEnemy) that was clicked on to confirm this attack. Not used for every attack
// attackID is the ID value of this attack. -1 for move.

// with charMap[? "id"] you can get the character's ID.
// with this and attackID you can find the specific attack being performed. 

// if you need the actual instance of the character, it is the value of global.selected.
// please note that the 'myID' variable in oCharacter and oEnemy is badly named and should be 'myPos'

// Targetting:
// if the attack hits all, you don't need the value of target
// if the attack hits any, you also don't need it; select a value at random
// if the attack hits two or three, the value of 'target' is the FIRST (closer to the front) character it hits.

var charMap = argument0;
var character = global.selected;
var target = argument1;
var attackID = argument2;

// Move
if attackID == -1 {
	swap_positions(character, target);
}

// Other
var charID = charMap[? "id"];
if (is_undefined(charID)) {
	show_error("Couldn't get charID", true);
}
switch (charID) {
case 0:
	// Shouldn't be possible. Throw error?
	break;
	
case 1:
	// god gamer
	switch (attackID) {
	case 0:
		// Ban Hammer
		break;
		
	case 1:
		// Suck my Dick
		break;
		
	case 2:
		//etc
		
	}
	break;
	
case 2:
	// Gaybriel
	switch (attackID) {
	case 0:
		// RP Spew
		break;
		
	case 1:
		//etc
		
	}
	break;
	
case 3:
	
	//etc
}