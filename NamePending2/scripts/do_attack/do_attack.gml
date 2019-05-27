// PG-13 Username, <your name here>
// @desc do_attack(character, target, attackID)
// Does attack. Called from oAttack->Step and oEnemy->Step

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

//get the attacks for this character
var charAttacks = charMap[? "attacks"];
if(is_undefined(charAttacks))
{
	show_error("No attacks defined for this character", true);
}

//get this character's stats
var charStats = charMap[? "stats"];

//get the stats of the target
//just for debuggin
var targTemp = global.enemies[global.enemyOrder[target.myID]]; //may not be needed
var targStats = targTemp[? "stats"]; //may not be needed

if(charMap[? "type"] == "Party Member")
{
	switch (charID) {
	case 0:
		// Shouldn't be possible. Throw error?
		break;
	
	case 1:
		// god gamer
		switch (attackID) {
		case 0:
			// Ban Hammer
			var dmg = dmg_calc(charStats[8]/10.0,1,10);
			if(dmg > 0)
			{
				targStats[@ 0] -= dmg;
				show_debug_message("Did " + string(abs(targStats[0])) + " dmg");
				break;
			}
			else
			{
				show_debug_message("Attack failed");
				break;
			}
			break;
		case 1:
			// Suck my dick
			var dmg = dmg_calc(charStats[8]/10.0,2,8);
			if(dmg > 0)
			{
				targStats[@ 0] -= dmg;
				show_debug_message("Did " + string(abs(targStats[0])) + " dmg");
				break;
			}
			else
			{
				show_debug_message("Attack failed");
				break;
			}
			break;
		
		case 2:
			//shashaa
			var dmg = dmg_calc(charStats[8]/10.0,3,5);
			if(dmg > 0)
			{
				targStats[@ 0] -= dmg;
				show_debug_message("Did " + string(abs(targStats[0])) + " dmg");
				break;
			}
			else
			{
				show_debug_message("Attack failed");
				break;
			}
			break;
		}
		break;
	
	case 2:
		// moon2M :mega: TESLAAAAAAAAAAAAA
		switch (attackID) {
		case	 0:
			// Run down
			var dmg = dmg_calc(charStats[8]/10.0,1,10);
			if(dmg > 0)
			{
				targStats[@ 0] -= dmg;
				show_debug_message("Did " + string(abs(targStats[0])) + " dmg");
				break;
			}
			else
			{
				show_debug_message("Attack failed");
				break;
			}
			break;
		
		case 1:
			//etc
			var dmg = dmg_calc(charStats[8]/10.0,1,10);
			if(dmg > 0)
			{
				targStats[@ 0] -= dmg;
				show_debug_message("Did " + string(abs(targStats[0])) + " dmg");
				break;
			}
			else
			{
				show_debug_message("Attack failed");
				break;
			}
			break;
		}
		break;
	
	case 3:
	
		//etc
	}
}
else
{
	
}