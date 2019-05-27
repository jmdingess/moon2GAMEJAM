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

// CUBES NOTES FOR WHOEVER DARES:
// Please check all my comments I might've fucked up a spot or two (mainly the end)
// Debuffs are always a chance unless it says 100%
// Buffs should always work

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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			//Needs stun chance
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			//Needs Riposte
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]+5);
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
			var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,1,3);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			// Happy Eddie soothes the pain.
			// Needs AOE heal
			break;
		
		case 2:
			//Sharpen Claws
			//Needs Attack up for self
			break;
		
		case 3:
			//Bite
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			//Scratching Post
			//needs to move eddie 2 spaces back
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]+3);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
			var dmg = dmg_calc(charStats[8]/10.0,2,[3]+[4]);
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
	else
	{
		if(charMap[? "type"] == "mob")
		{	
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					// Smile Stomp
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]+1);
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
				// Prime Pleb
				switch (attackID) {
				case 0:
					// Ask Dumb Question
					//Needs to text box question, needs to stun
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					// Shitpost
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
				// NaM
				switch (attackID) {
				case 0:
					// Explode
					// Needs to die
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]+1);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]+1);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
		else
		{
			if(charMap[? "type"] == "boss")
			{
				switch (charID) {
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
						//needs to 100% stun
						var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
						//Early Access!
						var dmg = dmg_calc(charStats[8]/10.0,3,4);
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
						var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]-2);
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
						var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
						var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]-2);
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
						var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
						var dmg = dmg_calc(charStats[8]/10.0,1,15);
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
						var dmg = dmg_calc(charStats[8]/10.0,8,16);
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
						var dmg = dmg_calc(charStats[8]/10.0,2,4);
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
					var dmg = dmg_calc(charStats[8]/10.0,1,[3]+[4]);
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
				
			//I don't know how to end this monkaS	
			break;
			
}
else
{
	
}