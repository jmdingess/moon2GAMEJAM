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

var gameManager = instance_find(oGameplayTurnManagement, 0);
if is_undefined(gameManager){
	show_error("Couldn't find game manager", true);
}

//get the attacks for this character
var charAttacks = charMap[? "attacks"];
if(is_undefined(charAttacks))
{
	show_error("No attacks defined for this character", true);
}

//get this character's stats
var charStats = character.myStats;

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
var targStats = target.myStats;

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
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);	
			break;
		case 1:
			// Suck my dick
			//Needs stun chance
			var dmgDealt = standard_attack(acc, int, dex, attackPower, target_luck, target, character);
			if (dmgDealt != 0) {
				// If we hit, 40% chance to stun
				if (hit_calc(0.4)) {
					target.stun += 1;
				}
			}
			return dmgDealt;
			break;
		
		case 2:
			//shashaa
			//Needs Riposte
			character.riposte += 1;
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		
		case 3:
			//Blap Blap
			var dmg = 0;
			repeat(2) {
				randEnemy = -1
				while randEnemy == -1 { // Really bad
					var randEnemy = get_character(target.object_index, irandom_range(1, 3));
				}
				// uses target luck not randEnemy luck, which is wrong
				dmg += standard_attack(acc, dex, int, attackPower, target_luck, randEnemy, character);
			}
			return dmg;
			break;
		
		case 4:
			//Variety Stream
			// TODO: Random Debuff
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					dmg += standard_attack(acc, int, dex, attackPower, get_char_luck(enemy), enemy, character);
				}
			}
			return dmg;
		}
		break;
	
	case 2:
		// Tesla Model S
		switch (attackID) {
		case 0:
			// Hit N Run
			// Needs Chance to bleed
			var dmg = standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.6)) { // 60% chance
					target.bleed += 3;
				}
			}
			return dmg;
			break;
		case 1:
			// Sentry Mode
			// Needs Defend target and defense bonus
			target.shield += 3;
			character.shield += 3;
			return 1;
			break;
		
		case 2:
			//Autopilot
			//Needs team evasion buff
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					// Not sure if this works how I want it to
					friend.myStats[6] += 4;
					friend.statBoosts[6] += 4;
				}
			}
			return 1;
			break;
		
		case 3:
			//Fully Retractable Sunroof
			//Needs Team Accuracy Buff
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					// Not sure if this works how I want it to
					friend.myStats[8] += 4;
					friend.statBoosts[8] += 4;
				}
			}
			return 1;
			break;
		
		case 4:
			//Overdrive
			return standard_attack(acc, int, dex, attackPower, target_luck, target, character);
		}
		break;
	
	case 3:
		// Suzuki Teriyaki
		switch (attackID) {
		case 0:
			// Sword Slash
			//Needs to move unit foward
			gameManager.charToMove = character;
			gameManager.spaces = 1;
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		case 1:
			// Gun shoot
			// needs to move unit backwards
			gameManager.charToMove = character;
			gameManager.spaces = -1;
			return standard_attack(acc, dex, int, attackPower, target_luck, target, character);
			break;
		
		case 2:
			//Body Pillow
			//Needs Stun Chance
			dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.4)) { // 40% chance
					target.stun += 1;
				}
			}
			return dmg;
			break;
		
		case 3:
			//AYAYA
			//Needs AoE Debuff
			var i;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					if (hit_calc_2(acc, get_char_luck(enemy))) {
						enemy.myStats[8] -= 3;
						enemy.statBoosts[8] -= 3;
					}
				}
			}
			return 1;
			break;
		
		case 4:
			//Full On AYAYA
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					dmg += standard_attack(acc, dex, int, attackPower, get_char_luck(enemy), enemy, character);
				}
			}
			return dmg;
			break;
		}
		break;
		
	case 4:
		// Purple Face Lady
		switch (attackID) {
		case 0:
			// Smug Face
			// Needs Int up
			character.statBoosts[5] += 4;
			return standard_attack(acc, int, dex, attackPower, target_luck, target, character);
		case 1:
			// Toxic Spam
			// Needs Bleed Chance
			dmg = standard_attack(acc, dex, int, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.4)) { // 40% chance
					target.bleed += 3;
				}
			}
			var enemy2 = get_character(target.object_index, target.myID-1);
			if enemy2 != -1 {
				var newdmg = standard_attack(acc, dex, int, attackPower, target_luck, target, character);
				if (newdmg != 0) {
					if (hit_calc(0.4)) { // 40% chance
						target.bleed += 3;
					}
				}
			}
			return dmg;
			break;
		
		case 2:
			//Cheer Strimmer
			//Needs Heal
			target.current_hp += int*attackPower;
			break;
		
		case 3:
			//Go Team Go!
			//Needs Team Heal
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					friend.current_hp += int*attackPower;
				}
			}
			return 1;
			break;
		
		case 4:
			//Chat Spam
			//Need Accuracy Debuff
			var i;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					if (hit_calc_2(acc, get_char_luck(enemy))) {
						enemy.myStats[8] -= 3;
						enemy.statBoosts[8] -= 3;
						if (hit_calc(0.3)) {
							enemy.bleed += 3;
						}
					}
				}
			}
			return 1;
			break;
		}
		break;
		
	case 5:
		// Aniki
		switch (attackID) {
		case 0:
			// Lashing
			//Needs multiple attack generator
			dmg = 0;
			var text = "";
			repeat(irandom_range(2, 5)) {
				text += "AHN! "
				dmg += standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			}
			attack_message(text);
			return dmg;
			break;
		case 1:
			// Ass we can
			//Needs Team Strength Buff
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					friend.myStats[3] += 4;
					friend.statBoosts[3] += 4;
				}
			}
			return 1;
			break;
		
		case 2:
			//Infernal Yukipo
			//Needs chance to stun
			dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.3)) { // 30% chance
					target.bleed += 4;
				}
			}
			break;
		
		case 3:
			//Get your ass back here!
			//Needs enemy movement force to front
			dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			if (dmg != 0) {
				move(target, 4);
			}
			break;
		
		case 4:
			//WOOP
			//Needs lifesteal heal
			dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			character.current_hp += dmg;
			break;
		}
		break;
		
	case 6:
		// Eddie
		switch (attackID) {
		case 0:
			// Claw Strike
			gameManager.charToMove = character;
			gameManager.spaces = 1;
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		case 1:
			// Happy Eddie soothes the pain.
			// Needs AOE heal
			var i;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					friend.current_hp += dex*attackPower;
				}
			}
			return 1;
			break;
		
		case 2:
			//Sharpen Claws
			//Needs Attack up for self
			character.myStats[4] += 4;
			character.statBoosts[4] += 4;
			break;
		
		case 3:
			//Bite
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
		
		case 4:
			//Scratching Post
			//needs to move eddie 2 spaces back
			gameManager.charToMove = character;
			gameManager.spaces = -2;
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
		}
		break;
		
	case 7:
		// Lord Barwick
		switch (attackID) {
		case 0:
			// Try Hard
			character.myStats[4] += 4;
			character.statBoosts[4] += 4;
			character.myStats[3] += 4;
			character.statBoosts[3] += 4;
			character.myStats[6] -= 4;
			character.myStats[6] -= 4;
			break;
		case 1:
			// Adaptive Sandbagging
			// Needs to add accuracy buff and riposte
			character.riposte += 3;
			character.myStats[6] += 4;
			character.myStats[6] += 4;
			break;
		
		case 2:
			//100 to 0
			character.stun += 1;
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		
		case 3:
			//Rushdown
			//Needs to move forward 2 spaces
			gameManager.charToMove = character;
			gameManager.spaces = 2;
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
		
		case 4:
			//Spinning Top
			//Needs to stun
			dmg = standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			if dmg != 0 {
				if (hit_calc(0.8)) { // 80% chance
					target.stun += 1;
				}
			}
			return dmg;
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
			gameManager.charToMove = character;
			gameManager.spaces = 1;
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		case 1:
			// Smile Stomp
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
		}
		break;
				
	case 2:
		// Prime Pleb
		switch (attackID) {
		case 0:
			// Ask Dumb Question
			//Needs to text box question, needs to lower dex now instead
			attack_message("Dumb Question");
			if (hit_calc_2(acc, target_luck)) {
				target.stun += 1;
				return 1; // we didn't actually do any damage but return nonzero so it knows to display hit
			}
			return 0; // missed
			break;
		case 1:
			// Shitpost
			return standard_attack(acc, int, dex, attackPower, target_luck, target, character);
			break;
			
		}
		break;
				
	case 3:
		// NaM
		switch (attackID) {
		case 0:
			// Explode
			// Needs to die
			gameManager.charToKill = character;
			return standard_attack(acc, dex, int, attackPower, target_luck, target, character);
			
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
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					friend.bleed = 0;
					friend.shield = 0;
					friend.riposte = 0;
					friend.stun = 0;
					var j;
					for (j = 0; j < 9; j++) {
						friend.myStats[i] -= friend.statBoosts[i];
						friend.statBoosts[i] = 0;
					}
				}
				var enemy = get_character(oCharacter, i);
				if (enemy != -1) {
					enemy.bleed = 0;
					enemy.shield = 0;
					enemy.riposte = 0;
					enemy.stun = 0;
					var j;
					for (j = 0; j < 9; j++) {
						enemy.myStats[i] -= enemy.statBoosts[i];
						enemy.statBoosts[i] = 0;
					}
				}
			}
			return 1;
			break;
		case 3:
			//Perfectly Balanced
			//needs to set all characters health to 50%
		}
		break;
				
	case 5:
		// Weeb
		switch (attackID) {
		case 0:
			// Protect sakurachan
			// Needs to defense buff, and protect target
			target.shield += 5;
			character.shield += 3;
			break;
		case 1:
			// Get out MOM REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
			return standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
				
		}
		break;
				
	case 6:
		// Troglodyte
		switch (attackID) {
		case 0:
			// Normie Following 
			//Needs to buff ally target
			target.myStats[3] += 4;
			target.myStats[4] += 4;
			target.statBoosts[3] += 4;
			target.statBoosts[4] += 4;
			break;
		case 1:
			// IMO
			// Needs to stun
			var dmg = standard_attack(acc, str, int, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.2)) { // 20% chance
					target.stun += 1;
				}
			}
			break;
		case 2:
			// Witch Hunt
			// Needs to lower attack and acc
			var dmg = standard_attack(acc, str, int, attackPower, target_luck, target, character);
			if (dmg != 0) {
				if (hit_calc(0.8)) { // 80% chance
					target.myStats[3] += 4;
					target.myStats[6] += 4;
					target.statBoosts[3] += 4;
					target.statBoosts[6] += 4;
				}
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
			gameManager.charToMove = character;
			gameManager.spaces = 1;
			var dmg = standard_attack(acc, dex, str, attackPower, target_luck, target, character);
			break;
		case 1:
			// Angry Slap
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
				
		}
		break;
				
	case 8:
		// poopsnail
		switch (attackID) {
		case 0:
			// Poop Fling
			return standard_attack(acc, str, int, attackPower, target_luck, target, character);
			break;
				
		}
		break;
				
	case 9:
	case 10:
	case 11:
		// Rabbit/Fox/Boar
		switch (attackID) {
		case 0:
			// Attack
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
				
		}
		break;
		
		
	case 12:
		// Corporate
		switch (attackID) {
		case 0:
			// Pleb Defense Force
			// Needs to spawn 2 prime plebs
			var i;
			var plebs = 2;
			for (i = 0; i < 4; i++) {
				friend = instance_find(oEnemy, i);
				if (friend.dead and friend.occupiedBy == -1 and plebs > 0) {
					friend.charMap = enemies[2];
					friend.dead = false;
					friend.myStats = friend.charMap[? "stats"]
					friend.bleed = 0;
					friend.stun = 0;
					friend.riposte = 0;
					friend.current_hp = friend.myStats[0];
					friend.shield = 0;
					// Insert into turn order right behind Corporate; they don't get an attack until next round
					var j;
					for (j = global.turnOrderSize; j > global.turn; j--) {
						global.turnOrder[j] = global.turnOrder[j-1];
					}
					global.turnOrder[global.turn] = friend;
					global.turn++;
					plebs--;
				}
			}
			break;
		case 1:
			// Soul for sponsorship
			// Needs to Str/Luck Down
			var i;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					if (hit_calc(0.6)) { // 60% chance
						enemy.myStats[3] -= 4;
						enemy.statBoosts[3] -= 4;
						enemy.myStats[6] -= 4;
						enemy.statBoosts[6] -= 4;
					}
				}
			}
			return 1;
			break;
					
		case 2:
			//Under the corporate thumb
			// stuns for two turns
			target.stun += 2;
			return 1;
			break;
					
		case 3:
			//Early Access!
			var i;
			var dmg = 0;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					dmg += standard_attack(acc, int, dex, attackPower, target_luck, target, character);
				}
				var friend = get_character(character.object_index, i);
				if (friend != -1) {
					friend.myStats[4] += 4;
					friend.statBoosts[4] += 4;
				}
			}
			return dmg;
			break;
					
		}
		break;	
					
	case 13:
		// Ricardo Milos
		switch (attackID) {
		case 0:
			var i;
			var dmg;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i);
				if (enemy != -1) {
					dmg += standard_attack(acc, dex, str, attackPower, target_luck, target, character);
				}
			}
			return dmg;
			break;
		case 1:
			// Coconut Bash
			return standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			break;
					
		case 2:
			//You Got That
			//Needs to heal based on damage dealt
			var dmg = standard_attack(acc, int, dex, attackPower, target_luck, target, character);
			current_hp += dmg;
			return dmg;
			break;
					
		case 3:
			//Dance of demons
			//needs to buff SPD/ATK/STR/DEX by 2, never falls off and can stack?
			
			// Buff STR/DEX/ACC by 2. If we don't set statBoost for them then they won't decay
			// But we also want the buff icon to show up, so we statBoost the useless stat SP.
			myStats[3] += 2;
			myStats[4] += 2;
			myStats[8] += 2;
			statBoosts[1] += 99;
			break;
					
		}
		break;
					
	case 14:
		// Old Moon
		switch (attackID) {
		case 0:
			// The True Ban Hammer
			var dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			if(dmg != 0)
			{
				if(hit_calc(0.6)) //60% chance? idk
				{
					target.stun += 1;	
					text += "Fuck you, cunt";
				}
				attack_message(text);
				return dmg;
			}
			break;
		case 1:
			// Howl into the Void
			// Needs to lower SPD/Str
			var i;
			for (i = 0; i < 4; i++) {
				var enemy = get_character(target.object_index, i); //just for testing right now
				if (enemy != -1) {
					enemy.myStats[3] -= 2;
					enemy.statBoosts[3] -= 2;
					enemy.myStats[7] -= 2;
					enemy.statBoosts[7] -= 2;
				}
			}
			break;
					
		case 2:
			//Cresent Moon
			//Chance to apply AoE bleed
			var succ = hit_calc(0.6); //60% chance of AoE bleed on all party members
			if(succ)
			{
				var i;
				for (i = 0; i < 4; i++) {
					var enemy = get_character(target.object_index, i);
					if (enemy != -1) {
						enemy.bleed += 3; // just for testing right now
					}
				}
			}
			break;
					
		}
		break;
					
	case 15:
		// Old moon Phase 2
		switch (attackID) {
		case 0:
		// eye of the gaping maw
		// -4 LCK for AoE
			var i;
				for (i = 0; i < 4; i++) {
					var enemy = get_character(target.object_index, i);
					if (enemy != -1) {
						enemy.myStats[6] -= 4; // just for testing right now, lowers LCK
						enemy.statBoosts[6] -= 4;
					}
				}
			break;
		case 1:
			// From the void it hungers
			// Spawn A tentacle monster
			break;
					
		case 2:
			//Rend of the cosmic gods
			// heavy attack
			// 1.5-2x ATK maybe?
			var i;
			for(i = 0; i < 4; i++)
			{
				var enemy = get_character(target.object_index, i);
				if(enemy != -1)
				{
					standard_attack(acc, str, dex, 1.5 * attackPower, get_char_luck(enemy), enemy, character);
				}
			}
			break;
					
		case 3:
			//The false gamer god
			// Needs to lower dex
			var i;
			for(i = 0; i < 4; i++)
			{
				var enemy = get_character(target.object_index, i);
				if(enemy != -1)
				{
					standard_attack(acc, str, dex, attackPower, get_char_luck(enemy), enemy, character);
					if(hit_calc(0.5)) // should this be per party member or overall?
					{
						enemy.myStats[4] -= 4;
						enemy.statBoosts[4] -= 4;
					}
				}
			}
			break;
					
		}
		break;
					
	case 16:
		// Tentacle monster
		switch (attackID) {
		case 0:
			// Attack
			var dmg = standard_attack(acc, str, dex, attackPower, target_luck, target, character);
			return dmg;
			break;
		}
		break;
	}	
}