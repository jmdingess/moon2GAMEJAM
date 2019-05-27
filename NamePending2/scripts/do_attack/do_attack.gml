// PG-13 Username, <your name here>
// @desc do_attack(character, target, attackID, attackPower)
// Does attack. Called from oAttack->Step and oEnemy->Step

// charMap is the map of the character that called it. Should be same as global.selected.myCharacter
// target is the instance (oCharacter or oEnemy) that was clicked on to confirm this attack. Not used for every attack
// attackID is the ID value of this attack. -1 for move.
// attackPower is a multiplier to be added to this attack's damage

// with charMap[? "id"] you can get the character's ID.
// with this and attackID you can find the specific attack being performed. 

// if you need the actual instance of the character, it is the value of global.selected.
// please note that the 'myID' variable in oCharacter and oEnemy is badly named and should be 'myPos'

// Targetting:
// if the attack hits all, you don't need the value of target
// if the attack hits any, you also don't need it; select a value at random
// if the attack hits two or three, the value of 'target' is the FIRST (closer to the front) character it hits.

// CUBES NOTES FOR WHOEVER DARES:
// Please check all my comments I might've fucked up a spot or two (mainly the end)
// Debuffs are always a chance unless it says 100%
// Buffs should always work

var charMap = argument0;
var character = global.selected;
var target = argument1;
var attackID = argument2;
var attackPower = argument3;

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

// for readability/sanity
var max_hp = charStats[0];
var curr_hp = character.current_hp;
var sp = charStats[1];
var limit = charStats[2];
var str = charStats[3];
var dex = charStats[4];
var int = charStats[5];
var luck = charStats[6];
var spd = charStats[7]; // speed is a game keyword ;_;
var acc = charStats[8];

//get the stats of the target
//just for debuggin
// PG-13: Both enemies and characters use do_attack. This next statement forces target to be an enemy
//var targTemp = global.enemies[global.enemyOrder[target.myID]]; //may not be needed
// PG-13: You can get the targetMap like this:
var targMap = -1;
if (target.object_index == oEnemy) {
	targMap = target.enemyMap; // where the maps for enemies are stored in oEnemy
}
else {
	targMap = target.myCharacter; // where the maps for characters are stored in oCharacter
}
if (is_undefined(targMap) or targMap == -1) {
	show_error("Target has no map", true);
}
var targStats = targMap[? "stats"];

var target_luck = targStats[6];

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
			return standard_attack(acc, str, dex, attackPower, target_luck, target);	
			break;
		case 1:
			// Suck my dick
			//Needs stun chance
			var dmgDealt = standard_attack(acc, int, dex, attackPower, target_luck, target);
			if (dmgDealt != 0) {
				// If we hit, 40% chance to stun
				if (random(1.0) <= 0.4) {
					target.stun += 1;
				}
			}
			return dmgDealt;
			break;
		
		case 2:
			//shashaa
			//Needs Riposte
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 3:
			//Blap Blap
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 4:
			//Variety Stream
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		// Tesla Model S
		switch (attackID) {
		case 0:
			// Hit N Run
			// Needs Chance to bleed
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
			// Sentry Mode
			// Needs Defend target and defense bonus
			break;
		
		case 2:
			//Autopilot
			//Needs team evasion buff
			break;
		
		case 3:
			//Fully Retractable Sunroof
			//Needs Team Accuracy Buff
			break;
		
		case 4:
			//Overdrive
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		// Suzuki Teriyaki
		switch (attackID) {
		case 0:
			// Sword Slash
			//Needs to move unit foward
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
			// Gun shoot
			// needs to move unit backwards
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
			//Body Pillow
			//Needs Stun Chance
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 3:
			//AYAYA
			//Needs AoE Debuff
			break;
		
		case 4:
			//Full On AYAYA
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex+5);
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
		
	case 4:
		// Purple Face Lady
		switch (attackID) {
		case 0:
			// Smug Face
			// Needs Int up
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			// Toxic Spam
			// Needs Bleed Chance
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
			//Cheer Strimmer
			//Needs Heal
			break;
		
		case 3:
			//Go Team Go!
			//Needs Team Heal
			break;
		
		case 4:
			//Chat Spam
			//Need Accuracy Debuff
			break;
		}
		break;
		
	case 5:
		// Aniki
		switch (attackID) {
		case 0:
			// Lashing
			//Needs multiple attack generator
			var dmg = dmg_calc((acc - target_luck)/20.0,1,3);
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
			// Ass we can
			//Needs Team Strength Buff
			break;
		
		case 2:
			//Infernal Yukipo
			//Needs chance to stun
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 3:
			//Get your ass back here!
			//Needs enemy movement force to front
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 4:
			//WOOP
			//Needs lifesteal heal
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
	case 6:
		// Eddie
		switch (attackID) {
		case 0:
			// Claw Strike
			return standard_attack(acc, dex, str, attackPower, target_luck, target);
			break;
		case 1:
			// Happy Eddie soothes the pain.
			// Needs AOE heal
			break;
		
		case 2:
			//Sharpen Claws
			//Needs Attack up for self
			break;
		
		case 3:
			//Bite
			return standard_attack(acc, str, dex, attackPower, target_luck, target);
			break;
		
		case 4:
			//Scratching Post
			//needs to move eddie 2 spaces back
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex+3);
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
		
	case 7:
		// Lord Barwick
		switch (attackID) {
		case 0:
			// Try Hard
			// Needs to increase dex and lower int
			break;
		case 1:
			// Adaptive Sandbagging
			// Needs to add accuracy buff and riposte
			break;
		
		case 2:
			//100 to 0
			//Needs ATK buff
			break;
		
		case 3:
			//Rushdown
			//Needs to move forward 2 spaces
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
		
		case 4:
			//Spinning Top
			//Needs to stun
			var dmg = dmg_calc((acc - target_luck)/20.0,2,str + dex);
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
	}
}
else { // ENEMIES
	switch (charID) {
	case 0:
		// Shouldn't be possible. Throw error?
		break;
				
	case 1:
		// Moon2S
		switch (attackID) {
		case 0:
			// Angry Lunge
			//Needs to move forward
			move(target, 1);
			return standard_attack(acc, dex, str, attackPower, target_luck, target);
			break;
		case 1:
			// Smile Stomp
			return standard_attack(acc, str, dex, attackPower, target_luck, target);
		}
		break;
				
	case 2:
		// Prime Pleb
		switch (attackID) {
		case 0:
			// Ask Dumb Question
			//Needs to text box question, needs to stun
			attack_message("Dumb Question", character.x + 32, character.y+32);
			if (hit_calc_2(acc, target_luck)) {
				target.stun += 1;
				return 1; // we didn't actually do any damage but return nonzero so it knows to display hit
			}
			return 0; // missed
			break;
		case 1:
			// Shitpost
			return standard_attack(acc, int, dex, attackPower, target_luck, target);
			break;
				
		}
		break;
				
	case 3:
		// NaM
		switch (attackID) {
		case 0:
			// Explode
			// Needs to die
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
				
	case 4:
		// moon2N
		switch (attackID) {
		case 0:
			//Undecided
			//Litterally nothing lmao
			break;
		case 1:
			// True Neutral
			// Needs to remove all buffs and debuffs, 100% chance
			break;
				
		}
		break;
				
	case 5:
		// Weeb
		switch (attackID) {
		case 0:
			// Protect sakurachan
			// Needs to defense buff , and protect target
			break;
		case 1:
			// Get out MOM REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex+1);
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
				
	case 6:
		// Troglodyte
		switch (attackID) {
		case 0:
			// Normie Following 
			//Needs to buff ally target
			break;
		case 1:
			// IMO
			// Needs to lower Speed
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			// Witch Hunt
			// Needs to lower attack and defense
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
				
	case 7:
		// Moon2VeryA
		switch (attackID) {
		case 0:
			// Angry Lunge
			// Needs to move forward
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			// Angry Slap
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex+1);
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
				
	case 8:
		// poopsnail
		switch (attackID) {
		case 0:
			// Poop Fling
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
				
	case 9:
		// Rabbit/Fox/Boar
		switch (attackID) {
		case 0:
			// Attack
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			
	case 10:
		// Rabbit/Fox/Boar
		switch (attackID) {
		case 0:
			// Attack
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
				
	case 11:
		// Rabbit/Fox/Boar
		switch (attackID) {
		case 0:
			// Attack
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
		
	case 12:
		// Corporate
		switch (attackID) {
		case 0:
			// Pleb Defense Force
			// Needs to spawn 2 prime plebs
			break;
		case 1:
			// Soul for sponsorship
			// Needs to Str/Luck Down
			break;
					
		case 2:
			//Under the corporate thumb
			// stuns for two turns
			target.stun += 2;
			
			break;
					
		case 3:
			//Early Access!
			var dmg = dmg_calc((acc - target_luck)/20.0,3,4);
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
					
	case 13:
		// Ricardo Milos
		switch (attackID) {
		case 0:
			// The Flick
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex-2);
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
			// Coconut Bash
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			//You Got That
			//Needs to heal based on damage dealt
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex-2);
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
					
		case 3:
			//Dance of demons
			//needs to buff SPD/ATK/STR/DEX by 1, never falls off and can stack?
			break;
					
		}
		break;
					
	case 14:
		// Old Moon
		switch (attackID) {
		case 0:
			// The True Ban Hammer
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
			// Howl into the Void
			// Needs to lower SPD/Str
			break;
					
		case 2:
			//Cresent Moon
			//Chance to apply AoE bleed
			break;
					
		}
		break;
					
	case 15:
		// Old moon Phase 2
		switch (attackID) {
		case 0:
			// Eye of the maw
			var dmg = dmg_calc((acc - target_luck)/20.0,1,15);
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
			// From the void it hungers
			// Spawn A tentacle monster
			break;
					
		case 2:
			//Rend of the cosmic gods
			var dmg = dmg_calc((acc - target_luck)/20.0,8,16);
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
					
		case 3:
			//The false gamer god
			// Needs to lower dex
			var dmg = dmg_calc((acc - target_luck)/20.0,2,4);
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
					
	case 16:
		// Tentacle monster
		switch (attackID) {
		case 0:
			// Attack
			var dmg = dmg_calc((acc - target_luck)/20.0,1,str + dex);
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
	}	
}