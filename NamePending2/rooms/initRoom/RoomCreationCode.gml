// Initialization of Global Variables

enum targetting {
	TARGET = 0,
	TARGETNEIGHBORS = 1,
	TARGETSELF = 2,
	TARGETANY = 3,
	TARGETALL = 4,
	TARGETTWO = 5,
	TARGETTHREE = 6,
	SPECIAL = 7
};

// map for movement command
global.movementMap = ds_map_create();
ds_map_add(global.movementMap, "id", -1);
ds_map_add(global.movementMap, "type", targetting.TARGETNEIGHBORS);
ds_map_add(global.movementMap, "targetDead", true);
ds_map_add(global.movementMap, "sprite", sPlaceholderAttack);
ds_map_add(global.movementMap, "displayName", "Move");
ds_map_add(global.movementMap, "desc", "Move forward or backward.");
ds_map_add(global.movementMap, "charPosition", [1, 1, 1, 1]);

// Create stats definitions and sprites
//stats values:
// 0 is hp
// 1 is sp
// 2 is the limit meter
// 3 is Strength 
// 4 is Dexterity
// 5 is intelligence 
// 6 is Luck
// 7 is Speed
// 8 is Accuracy

global.stats[0] = ds_map_create();
ds_map_add(global.stats[0], "id", 0);
ds_map_add(global.stats[0], "sprite", -1);
ds_map_add(global.stats[0], "displayName", "Health");

global.stats[1] = ds_map_create();
ds_map_add(global.stats[1], "id", 1);
ds_map_add(global.stats[1], "sprite", -1);
ds_map_add(global.stats[1], "displayName", "Skill Points");

global.stats[2] = ds_map_create();
ds_map_add(global.stats[2], "id", 2);
ds_map_add(global.stats[2], "sprite", -1);
ds_map_add(global.stats[2], "displayName", "Limit Meter");

global.stats[3] = ds_map_create();
ds_map_add(global.stats[3], "id", 3);
ds_map_add(global.stats[3], "sprite", -1);
ds_map_add(global.stats[3], "displayName", "Strength");

global.stats[4] = ds_map_create();
ds_map_add(global.stats[4], "id", 4);
ds_map_add(global.stats[4], "sprite", -1);
ds_map_add(global.stats[4], "displayName", "Dexterity");

global.stats[5] = ds_map_create();
ds_map_add(global.stats[5], "id", 5);
ds_map_add(global.stats[5], "sprite", -1);
ds_map_add(global.stats[5], "displayName", "Intelligence");

global.stats[6] = ds_map_create();
ds_map_add(global.stats[6], "id", 6);
ds_map_add(global.stats[6], "sprite", -1);
ds_map_add(global.stats[6], "displayName", "Luck");

global.stats[7] = ds_map_create();
ds_map_add(global.stats[7], "id", 7);
ds_map_add(global.stats[7], "sprite", -1);
ds_map_add(global.stats[7], "displayName", "Speed");

global.stats[8] = ds_map_create();
ds_map_add(global.stats[8], "id", 8);
ds_map_add(global.stats[8], "sprite", -1);
ds_map_add(global.stats[8], "displayName", "Accuracy");

// Initialize Characters

var attacks;
// empty position; 
global.characters[0] = ds_map_create();
ds_map_add(global.characters[0], "type", "empty");
ds_map_add(global.characters[0], "displayName", "Empty Space")
ds_map_add(global.characters[0], "sprite", sEmptyChar);
attacks = ds_list_create()
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Placeholder attack");
ds_map_add(attacks[|0], "desc", "placeholder description");
ds_map_add(attacks[|0], "charPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|0], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|0], "atksprite", splaceholder_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|1], "type", targetting.TARGET);
ds_map_add(attacks[|1], "displayName", "Placeholder attack");
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "Placeholder attack");
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Placeholder attack");
ds_map_add(global.characters[0], "attacks", attacks);
ds_map_add(global.characters[0], "stats", [0, 0, 0, 0, 0, 0, 0, 0, 0]);
ds_map_add(global.characters[0], "hit", "splaceholder_hit");
//place to add turn order
// Moon
global.characters[1] = ds_map_create();
ds_map_add(global.characters[1], "type", "Party Member");
ds_map_add(global.characters[1], "displayName", "Moon");
ds_map_add(global.characters[1], "sprite", sMoon);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Ban Hammer");
ds_map_add(attacks[|0], "desc", "Attack an enemy with the power of chat moderation.");
ds_map_add(attacks[|0], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sMoon_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|1], "type", targetting.TARGET);
ds_map_add(attacks[|1], "displayName", "Suck my Dick");
ds_map_add(attacks[|1], "desc", "Attack an distant target with chance to stun.");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "atksprite", sMoon_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "ShaShaa");
ds_map_add(attacks[|2], "desc", "Attack an enemy; gain riposte.");
ds_map_add(attacks[|2], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|2], "atksprite", sMoon_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|3], "type", targetting.TARGETANY);
ds_map_add(attacks[|3], "displayName", "BlapBlapp");
ds_map_add(attacks[|3], "desc", "Attack 2 random targets with a gat.");
ds_map_add(attacks[|3], "charPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|3], "targetPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|3], "atksprite", sMoon_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|4], "type", targetting.TARGETALL);
ds_map_add(attacks[|4], "displayName", "Variety Stream");
ds_map_add(attacks[|4], "desc", "Attack all enemies, Random debuff for all enemies.");
ds_map_add(attacks[|4], "charPosition", [0, 1, 1, 0]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|4], "atksprite", sMoon_atk);
ds_map_add(global.characters[1], "attacks", attacks);
ds_map_add(global.characters[1], "stats", [31, 0, 0, 6, 4, 5, 8, 3, 4]);
ds_map_add(global.characters[1], "hit", "sMoon_hit");

// Tesla Model S
global.characters[2] = ds_map_create();
ds_map_add(global.characters[2], "type", "Party Member");
ds_map_add(global.characters[2], "displayName", "Tesla Model S");
ds_map_add(global.characters[2], "sprite", sTesla);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sTesla_buttonHitNRun);
ds_map_add(attacks[|0], "displayName", "Hit and Run");
ds_map_add(attacks[|0], "desc", "Run down target enemy with chance to bleed.");
ds_map_add(attacks[|0], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|0], "atksprite", sTesla_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sTesla_buttonSentry);
ds_map_add(attacks[|1], "displayName", "Sentry Mode Protection");
ds_map_add(attacks[|1], "desc", "Defends ally target, increasing armor for the Tesla.");
ds_map_add(attacks[|1], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|1], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "atksprite", sTesla_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sTesla_buttonAuto);
ds_map_add(attacks[|2], "displayName", "Autopilot Assistance");
ds_map_add(attacks[|2], "desc", "Team evasion buff, insuring a safe drive in a Tesla");
ds_map_add(attacks[|2], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|2], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "atksprite", sTesla_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sTesla_buttonRoof);
ds_map_add(attacks[|3], "displayName", "Fully Retractable Sunroof");
ds_map_add(attacks[|3], "desc", "Increases style, which isn't a mechanic in our game, but also gives the parties accuracy.");
ds_map_add(attacks[|3], "charPosition", [0, 1, 0, 1]);
ds_map_add(attacks[|3], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "atksprite", sTesla_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sTesla_buttonOverdrive);
ds_map_add(attacks[|4], "displayName", "Tesla Overdrive");
ds_map_add(attacks[|4], "desc", "Hidden deployable laser to melt enemies.");
ds_map_add(attacks[|4], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|4], "atksprite", sTesla_hit);
ds_map_add(global.characters[2], "attacks", attacks);
ds_map_add(global.characters[2], "stats", [27, 0, 0, 5, 8, 7, 2, 5, 3]);
ds_map_add(global.characters[2], "hit", "sTesla_hit");

// Suzuki Teriyaki
global.characters[3] = ds_map_create();
ds_map_add(global.characters[3], "type", "Party Member");
ds_map_add(global.characters[3], "displayName", "Suzuki Teriyaki");
ds_map_add(global.characters[3], "sprite", sSuzuki);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sSuzuki_buttonSlash);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Sword Slash");
ds_map_add(attacks[|0], "desc", "Attack an enemy, moves forward one space.");
ds_map_add(attacks[|0], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sSuzuki_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sSuzuki_buttonShoot);
ds_map_add(attacks[|1], "type", targetting.TARGET);
ds_map_add(attacks[|1], "displayName", "Black Rock Shooter");
ds_map_add(attacks[|1], "desc", "Shoots gun, falls back one space.");
ds_map_add(attacks[|1], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "atksprite", sSuzuki_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sSuzuki_buttonPillow);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "Full Body Pillow Slam");
ds_map_add(attacks[|2], "desc", "Attack an enemy, with chance to stun.");
ds_map_add(attacks[|2], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|2], "atksprite", sSuzuki_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sSuzuki_buttonAYAYA);
ds_map_add(attacks[|3], "type", targetting.TARGETALL);
ds_map_add(attacks[|3], "displayName", "AYAYA");
ds_map_add(attacks[|3], "desc", "Lets out an AYAYA, enemies get DEF debuff.");
ds_map_add(attacks[|3], "charPosition", [1, 0, 1, 0]);
ds_map_add(attacks[|3], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "atksprite", sSuzuki_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sSuzuki_buttonAYFull);
ds_map_add(attacks[|4], "type", targetting.TARGETALL);
ds_map_add(attacks[|4], "displayName", "Full on AYAYA");
ds_map_add(attacks[|4], "desc", "Attacks all enemies for huge damage.");
ds_map_add(attacks[|4], "charPosition", [0, 1, 0, 0]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|4], "atksprite", sSuzuki_atk);
ds_map_add(global.characters[3], "attacks", attacks);
ds_map_add(global.characters[3], "stats", [23, 0, 0, 4, 7, 2, 4, 8, 5]);

// Purple Lady Face
global.characters[4] = ds_map_create();
ds_map_add(global.characters[4], "type", "Party Member");
ds_map_add(global.characters[4], "displayName", "Purple Lady Face");
ds_map_add(global.characters[4], "sprite", sPurpleLady);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPurpleLady_buttonSmug);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Smug Face");
ds_map_add(attacks[|0], "desc", "Attack an enemy, Int up");
ds_map_add(attacks[|0], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sPurpleLady_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sPurpleLady_atk);
ds_map_add(attacks[|1], "type", targetting.TARGETTWO);
ds_map_add(attacks[|1], "displayName", "Toxic Spam");
ds_map_add(attacks[|1], "desc", "Attack two rear enemies, chance for bleed damage.");
ds_map_add(attacks[|1], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|1], "atksprite", sPurpleLady_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sPurpleLady_atk);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "Cheer Strimmer");
ds_map_add(attacks[|2], "desc", "Heal Target");
ds_map_add(attacks[|2], "charPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|2], "targetPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|2], "atksprite", sPurpleLady_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sPurpleLady_atk);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Go Team Go!");
ds_map_add(attacks[|3], "desc", "Heal Full Team");
ds_map_add(attacks[|3], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [1, 0, 0, 0]);
ds_map_add(attacks[|3], "atksprite", sPurpleLady_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sPurpleLady_atk);
ds_map_add(attacks[|4], "type", targetting.TARGETALL);
ds_map_add(attacks[|4], "displayName", "Now I'm mad moon2A");
ds_map_add(attacks[|4], "desc", "All enemies get accuracy debuff, with chance for bleed.");
ds_map_add(attacks[|4], "charPosition", [0, 1, 1, 0]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|4], "atksprite", sPurpleLady_atk);
ds_map_add(global.characters[4], "attacks", attacks);
ds_map_add(global.characters[4], "stats", [19, 0, 0, 3, 5, 8, 8, 3, 3]);

// Aniki (billy herrington) 
global.characters[5] = ds_map_create();
ds_map_add(global.characters[5], "type", "Party Member");
ds_map_add(global.characters[5], "displayName", "Aniki");
ds_map_add(global.characters[5], "sprite", sAniki);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sAniki_buttonLash);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Lash of the Spanking");
ds_map_add(attacks[|0], "desc", "Attack an enemy for 2-5 hits");
ds_map_add(attacks[|0], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sAniki_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sAniki_buttonAss);
ds_map_add(attacks[|1], "type", targetting.TARGETALL);
ds_map_add(attacks[|1], "displayName", "Ass we can");
ds_map_add(attacks[|1], "desc", "Team Defense buff");
ds_map_add(attacks[|1], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|1], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "atksprite", sAniki_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sAniki_buttonInfernal);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "Infernal Yukipo");
ds_map_add(attacks[|2], "desc", "Attack an enemy, chance to stun.");
ds_map_add(attacks[|2], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "atksprite", sAniki_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sAniki_buttonGet);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Get your ass back here!");
ds_map_add(attacks[|3], "desc", "Attack a rear enemy, pull them to the front");
ds_map_add(attacks[|3], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|3], "atksprite", sAniki_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sAniki_buttonWoop);
ds_map_add(attacks[|4], "type", targetting.TARGETSELF);
ds_map_add(attacks[|4], "displayName", "WOOP");
ds_map_add(attacks[|4], "desc", "Let out a woop on a target for damage, Heal Self for damage");
ds_map_add(attacks[|4], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|4], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|4], "atksprite", sAniki_atk);
ds_map_add(global.characters[5], "attacks", attacks);
ds_map_add(global.characters[5], "stats", [35, 0, 0, 9, 3, 4, 8, 2, 4]);

// Eddie
global.characters[6] = ds_map_create();
ds_map_add(global.characters[6], "type", "Party Member");
ds_map_add(global.characters[6], "displayName", "Eddie");
ds_map_add(global.characters[6], "sprite", sEddie);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sEddie_buttonScratch);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Claw Strike");
ds_map_add(attacks[|0], "desc", "Attack an enemy, move forward.");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sEddie_Atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sEddie_buttonLick);
ds_map_add(attacks[|1], "type", targetting.TARGETSELF);
ds_map_add(attacks[|1], "displayName", "Happy Eddie soothes the pain.");
ds_map_add(attacks[|1], "desc", "AoE Heal");
ds_map_add(attacks[|1], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|1], "atksprite", sEddie_Atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sEddie_buttonSharpen);
ds_map_add(attacks[|2], "type", targetting.TARGETSELF);
ds_map_add(attacks[|2], "displayName", "Sharpen claws");
ds_map_add(attacks[|2], "desc", "Attack buff for self.");
ds_map_add(attacks[|2], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|2], "atksprite", sEddie_Atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sEddie_buttonBite);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Bite");
ds_map_add(attacks[|3], "desc", "Bite an enemy, cause bleed.");
ds_map_add(attacks[|3], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|3], "atksprite", sEddie_Atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sEddie_buttonScratch);
ds_map_add(attacks[|0], "type", targetting.TARGETNEIGHBORS);
ds_map_add(attacks[|4], "displayName", "Scratching post");
ds_map_add(attacks[|4], "desc", "Unleash a fury of attacks like they were Moon's arm, move back 2 spaces.");
ds_map_add(attacks[|4], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|4], "atksprite", sEddie_Atk);
ds_map_add(global.characters[6], "attacks", attacks);
ds_map_add(global.characters[6], "stats", [21, 0, 0, 3, 4, 6, 7, 5, 5]);

// Lord Barwick
global.characters[7] = ds_map_create();
ds_map_add(global.characters[7], "type", "Party Member");
ds_map_add(global.characters[7], "displayName", "Lord Barwick");
ds_map_add(global.characters[7], "sprite", sBarwick);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sBarwick_atk);
ds_map_add(attacks[|0], "type", targetting.TARGETSELF);
ds_map_add(attacks[|0], "displayName", "Try Hard");
ds_map_add(attacks[|0], "desc", "Toggle ability increases dmg and def but increase debuff chances.");
ds_map_add(attacks[|0], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|0], "atksprite", sBarwick_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sBarwick_atk);
ds_map_add(attacks[|1], "type", targetting.TARGETSELF);
ds_map_add(attacks[|1], "displayName", "Adaptive Sandbagging");
ds_map_add(attacks[|1], "desc", "Riposte and Acc buff");
ds_map_add(attacks[|1], "charPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|1], "atksprite", sBarwick_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sBarwick_atk);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "100 to Zero");
ds_map_add(attacks[|2], "desc", "Attack buff for self.");
ds_map_add(attacks[|2], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|2], "atksprite", sBarwick_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sBarwick_atk);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Rushdown");
ds_map_add(attacks[|3], "desc", "Attack enemy, chance to stun");
ds_map_add(attacks[|3], "charPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|3], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|3], "atksprite", sBarwick_atk);
attacks[|4] = ds_map_create();
ds_map_add(attacks[|4], "id", 4);
ds_map_add(attacks[|4], "sprite", sBarwick_atk);
ds_map_add(attacks[|4], "type", targetting.TARGET);
ds_map_add(attacks[|4], "displayName", "Spinning Top");
ds_map_add(attacks[|4], "desc", "Attack an enemy, High chance to stun");
ds_map_add(attacks[|4], "charPosition", [0, 0, 0, 1]);
ds_map_add(attacks[|4], "targetPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|4], "atksprite", sBarwick_atk);
ds_map_add(global.characters[7], "attacks", attacks);
ds_map_add(global.characters[7], "stats", [25, 0, 0, 6, 4, 3, 2, 7, 8]);

// Enemies
// empty position; 
global.enemies[0] = ds_map_create();
ds_map_add(global.enemies[0], "type", "empty");
ds_map_add(global.enemies[0], "displayName", "Empty Space")
ds_map_add(global.enemies[0], "sprite", sEmptyChar);
attacks = ds_list_create()
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Placeholder attack");
ds_map_add(attacks[|0], "desc", "placeholder description");
ds_map_add(attacks[|0], "charPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|0], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|0], "atksprite", splaceholder_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|1], "type", targetting.TARGET);
ds_map_add(attacks[|1], "displayName", "Placeholder attack");
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|2], "type", targetting.TARGET);
ds_map_add(attacks[|2], "displayName", "Placeholder attack");
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|3], "type", targetting.TARGET);
ds_map_add(attacks[|3], "displayName", "Placeholder attack");
ds_map_add(global.enemies[0], "attacks", attacks);
ds_map_add(global.enemies[0], "stats", [0, 0, 0, 0, 0, 0, 0, 0, 0]);

// moon2S
global.enemies[1] = ds_map_create();
ds_map_add(global.enemies[1], "type", "Mob");
ds_map_add(global.enemies[1], "displayName", "moon2S");
ds_map_add(global.enemies[1], "sprite", sMoon2S);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sMoon2S_atk);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Angry Lunge");
ds_map_add(attacks[|0], "desc", "Attack an enemy, move forward.");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2S_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sMoon2S_atk);
ds_map_add(attacks[|1], "displayName", "Smile Stomp");
ds_map_add(attacks[|1], "desc", "Attack an Enemy"); 
ds_map_add(attacks[|1], "charPosition", [0, 0, 0, 1]); 
ds_map_add(attacks[|1], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 2);
ds_map_add(attacks[|1], "atksprite", sMoon2S_atk);
ds_map_add(global.enemies[1], "attacks", attacks);
ds_map_add(global.enemies[1], "stats", [15, 0, 0, 2, 6, 4, 4, 10, 4]);

// Prime Pleb
global.enemies[2] = ds_map_create();
ds_map_add(global.enemies[2], "type", "Mob");
ds_map_add(global.enemies[2], "displayName", "Prime Pleb");
ds_map_add(global.enemies[2], "sprite", sPrimePleb);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPrimePleb_atk);
ds_map_add(attacks[|0], "displayName", "Ask Dumb Question");
ds_map_add(attacks[|0], "desc", "Asks the streamer what OW stands for, stuns the target");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]); //don't want to mess with the values
ds_map_add(attacks[|0], "weight", 2);
ds_map_add(attacks[|0], "atksprite", sPrimePleb_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sPrimePleb_atk);
ds_map_add(attacks[|1], "displayName", "Shitpost");
ds_map_add(attacks[|1], "desc", "Says something insulting to target/ damages target"); 
ds_map_add(attacks[|1], "charPosition", [0, 1, 1, 1]); 
ds_map_add(attacks[|1], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sPrimePleb_atk);
ds_map_add(global.enemies[2], "attacks", attacks);
ds_map_add(global.enemies[2], "stats", [4, 0, 0, 1, 2, 7, 7, 7, 6]);

// NaM
global.enemies[3] = ds_map_create();
ds_map_add(global.enemies[3], "type", "Mob");
ds_map_add(global.enemies[3], "displayName", "NaM");
ds_map_add(global.enemies[3], "sprite", sNaM);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sPlaceholderAttack);
ds_map_add(attacks[|0], "displayName", "Suicide");
ds_map_add(attacks[|0], "desc", "Blows up");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sExplosion_Atk);
ds_map_add(global.enemies[3], "attacks", attacks);
ds_map_add(global.enemies[3], "stats", [9, 0, 0, 1, 1, 1, 1, 1, 10]);

// moon2N
global.enemies[4] = ds_map_create();
ds_map_add(global.enemies[4], "type", "Mob");
ds_map_add(global.enemies[4], "displayName", "moon2N");
ds_map_add(global.enemies[4], "sprite", sMoon2N);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sMoon2N_Atk);
ds_map_add(attacks[|0], "displayName", "Undecided");
ds_map_add(attacks[|0], "desc", "Nothing, skip turn");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2N);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sMoon2N_Atk);
ds_map_add(attacks[|1], "type", targetting.TARGETALL);
ds_map_add(attacks[|1], "displayName", "True Neutral");
ds_map_add(attacks[|1], "desc", "Removes all buffs and debuffs from all characters.");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2N_Atk);
ds_map_add(global.enemies[4], "attacks", attacks);
ds_map_add(global.enemies[4], "stats", [15, 0, 0, 4, 4, 10, 4, 6, 2]);

// Weeb
global.enemies[5] = ds_map_create();
ds_map_add(global.enemies[5], "type", "Mob");
ds_map_add(global.enemies[5], "displayName", "Weeb");
ds_map_add(global.enemies[5], "sprite", -1);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGETNEIGHBORS);
ds_map_add(attacks[|0], "displayName", "I must protect my Sakura-Chan!");
ds_map_add(attacks[|0], "desc", "Guard a unit, increase defense");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 0]);
ds_map_add(attacks[|0], "targetAllyPosition", [0, 0, 0, 0]); 
ds_map_add(attacks[|0], "weight", 2);
ds_map_add(attacks[|0], "atksprite", sWeeb_sakura);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", -1);
ds_map_add(attacks[|1], "displayName", "Get out of my room mom REEEE");
ds_map_add(attacks[|1], "desc", "Attacks a target for large damage.");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sWeeb_atk);
ds_map_add(global.enemies[5], "attacks", attacks);
ds_map_add(global.enemies[5], "stats", [15, 0, 0, 4, 6, 5, 4, 6, 5]);

//Troglodyte
global.enemies[6] = ds_map_create();
ds_map_add(global.enemies[6], "type", "Mob");
ds_map_add(global.enemies[6], "displayName", "Troglodyte");
ds_map_add(global.enemies[6], "sprite", sPlaceholderChar);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "displayName", "Normie Following");
ds_map_add(attacks[|0], "desc", "Buff friendly with attack boost.");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetAllyPosition", [1, 1, 1, 1]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sTrog_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", -1);
ds_map_add(attacks[|1], "displayName", "IMO");
ds_map_add(attacks[|1], "desc", "Attack target, chance to cause slow");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 0, 1, 1]);
ds_map_add(attacks[|1], "weight", 2);
ds_map_add(attacks[|1], "atksprite", sTrog_imo);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", -1);
ds_map_add(attacks[|2], "displayName", "Witch Hunt");
ds_map_add(attacks[|2], "desc", "Attack, lower DEF and ACC");
ds_map_add(attacks[|2], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "weight", 1);
ds_map_add(attacks[|2], "atksprite", sTrog_atk);
ds_map_add(global.enemies[6], "attacks", attacks);
ds_map_add(global.enemies[6], "stats", [19, 0, 0, 5, 6, 5, 3, 8, 3]);

// moon2VeryA
global.enemies[7] = ds_map_create();
ds_map_add(global.enemies[7], "type", "Mob");
ds_map_add(global.enemies[7], "displayName", "moon2A");
ds_map_add(global.enemies[7], "sprite", sMoon2VeryA);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sMoon2VeryA_atk);
ds_map_add(attacks[|0], "displayName", "Angry Lunge");
ds_map_add(attacks[|0], "desc", "Attack an enemy, move forward.");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2VeryA_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sMoon2VeryA_atk);
ds_map_add(attacks[|1], "displayName", "Angry Slap");
ds_map_add(attacks[|1], "desc", "Attack an Enemy");
ds_map_add(attacks[|1], "charPosition", [0, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|1], "weight", 2);
ds_map_add(attacks[|1], "atksprite", sMoon2VeryA_atk);
ds_map_add(global.enemies[7], "attacks", attacks);
ds_map_add(global.enemies[7], "stats", [15, 0, 0, 10, 6, 4, 4, 2, 4]);

// poopsnail
global.enemies[8] = ds_map_create();
ds_map_add(global.enemies[8], "type", "Mob");
ds_map_add(global.enemies[8], "displayName", "Poopsnail");
ds_map_add(global.enemies[8], "sprite", sPoopSnail);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Poop fling");
ds_map_add(attacks[|0], "desc", "Attack an enemy");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 0, 0]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2S_atk);
ds_map_add(global.enemies[8], "attacks", attacks);
ds_map_add(global.enemies[8], "stats", [7, 0, 0, 2, 2, 9, 4, 8, 5]);

// Wabbit AKA clone spam
global.enemies[9] = ds_map_create();
ds_map_add(global.enemies[9], "type", "Mob");
ds_map_add(global.enemies[9], "displayName", "Pepegabbit");
ds_map_add(global.enemies[9], "sprite", sRabbit);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Attack");
ds_map_add(attacks[|0], "desc", "Attack an enemy");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2S_atk);
ds_map_add(global.enemies[9], "attacks", attacks);
ds_map_add(global.enemies[9], "stats", [12, 0, 0, 1, 6, 4, 6, 7, 6]);

global.enemies[10] = ds_map_create();
ds_map_add(global.enemies[10], "type", "Mob");
ds_map_add(global.enemies[10], "displayName", "Doar");
ds_map_add(global.enemies[10], "sprite", sDoar);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Attack");
ds_map_add(attacks[|0], "desc", "Attack an enemy");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2S_atk);
ds_map_add(global.enemies[10], "attacks", attacks);
ds_map_add(global.enemies[10], "stats", [12, 0, 0, 1, 6, 4, 6, 7, 6]);

global.enemies[11] = ds_map_create();
ds_map_add(global.enemies[11], "type", "Mob");
ds_map_add(global.enemies[11], "displayName", "DEVox");
ds_map_add(global.enemies[11], "sprite", sFox);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGET);
ds_map_add(attacks[|0], "displayName", "Attack");
ds_map_add(attacks[|0], "desc", "Attack an enemy");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]); 
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sMoon2S_atk);
ds_map_add(global.enemies[11], "attacks", attacks);
ds_map_add(global.enemies[11], "stats", [12, 0, 0, 1, 6, 4, 6, 7, 6]);

//Corporate , boss 1
global.enemies[12] = ds_map_create();
ds_map_add(global.enemies[12], "type", "Boss");
ds_map_add(global.enemies[12], "displayName", "Corporation");
ds_map_add(global.enemies[12], "sprite", sEsports);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sEsports_atk);
ds_map_add(attacks[|0], "type", targetting.SPECIAL);
ds_map_add(attacks[|0], "targetDead", true);
//We should make this attack always happen first, and cooldown of 3 turns
ds_map_add(attacks[|0], "displayName", "Pleb Defense Force");
ds_map_add(attacks[|0], "desc", "Spawn 2 plebs");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "weight", 3);
ds_map_add(attacks[|0], "atksprite", sEsports_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sEsports_atk);
ds_map_add(attacks[|1], "type", targetting.TARGETALL);
ds_map_add(attacks[|1], "displayName", "Soul for Sponsorship");
ds_map_add(attacks[|1], "desc", "All enemies chance for STR,LUCK Down");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sEsports_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sEsports_atk);
ds_map_add(attacks[|2], "displayName", "Under the corporate thumb");
ds_map_add(attacks[|2], "desc", "attack, Target skips their next turn");
ds_map_add(attacks[|2], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "weight", 1);
ds_map_add(attacks[|2], "atksprite", sEsports_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sEsports_atk);
ds_map_add(attacks[|3], "displayName", "Early Access!");
ds_map_add(attacks[|3], "desc", "Attack all enemies for minor damage, increases team DEX");
ds_map_add(attacks[|3], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "weight", 1);
ds_map_add(attacks[|3], "atksprite", sEsports_atk);
ds_map_add(global.enemies[12], "attacks", attacks);
ds_map_add(global.enemies[12], "stats", [70, 0, 0, 9, 4, 9, 4, 1, 3]);

//Ricardo Milos, boss 2
global.enemies[13] = ds_map_create();
ds_map_add(global.enemies[13], "type", "Boss");
ds_map_add(global.enemies[13], "displayName", "Ricardo Milos");
ds_map_add(global.enemies[13], "sprite", sRicardo);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sRicardo_atk);
ds_map_add(attacks[|0], "type", targetting.TARGETALL);
ds_map_add(attacks[|0], "displayName", "The Flick");
ds_map_add(attacks[|0], "desc", "Damage to all enemies");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sRicardo_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sRicardo_atk);
//I don't know what the hell the coconut bash is
ds_map_add(attacks[|1], "displayName", "Coconut Bash");
ds_map_add(attacks[|1], "desc", "Heavy damage to front target");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [1, 0, 0, 0]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sRicardo_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sRicardo_atk);
ds_map_add(attacks[|2], "displayName", "You got that");
ds_map_add(attacks[|2], "desc", "Deal damage to target, heal to that amount");
ds_map_add(attacks[|2], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 0, 0]);
ds_map_add(attacks[|2], "weight", 1);
ds_map_add(attacks[|2], "atksprite", sRicardo_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
//This move should be used every 3 turns, doesn't fall off.
ds_map_add(attacks[|3], "sprite", sRicardo_atk);
ds_map_add(attacks[|3], "type", targetting.SPECIAL);
ds_map_add(attacks[|3], "displayName", "Dance of demons");
ds_map_add(attacks[|3], "desc", "Increase SPD,ATK,STR,DEX, does not fall off");
ds_map_add(attacks[|3], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [0, 0, 0, 0]);
ds_map_add(attacks[|3], "weight", 1);
ds_map_add(attacks[|3], "atksprite", sRicardo_atk);
ds_map_add(global.enemies[13], "attacks", attacks);
ds_map_add(global.enemies[13], "stats", [66, 0, 0, 7, 7, 7, 2, 6, 1]);

//Old Moon, boss 3, Phase 1
global.enemies[14] = ds_map_create();
ds_map_add(global.enemies[14], "type", "Boss");
ds_map_add(global.enemies[14], "displayName", "The Old Moon");
ds_map_add(global.enemies[14], "sprite", sOldMoon);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sOldMoon_atk);
ds_map_add(attacks[|0], "displayName", "The true ban hammer");
ds_map_add(attacks[|0], "desc", "Hit front target, chance to stun");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 0, 0, 0]);
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sOldMoon_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sOldMoon_atk);
ds_map_add(attacks[|1], "type", targetting.TARGETALL);
ds_map_add(attacks[|1], "displayName", "Howl into the void");
ds_map_add(attacks[|1], "desc", "Lower all enemy SPD,ATK");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sOldMoon_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sOldMoon_atk);
ds_map_add(attacks[|2], "type", targetting.TARGETALL);
ds_map_add(attacks[|2], "displayName", "Cresent Moon");
ds_map_add(attacks[|2], "desc", "Chance to bleed all enemies");
ds_map_add(attacks[|2], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "weight", 1);
ds_map_add(attacks[|2], "atksprite", sOldMoon_atk);
ds_map_add(global.enemies[14], "attacks", attacks);
ds_map_add(global.enemies[14], "stats", [42, 0, 0, 2, 10, 2, 6, 8, 2]);

//Pit lord,moon2H , boss 3, phase 2
//This boss should take 2 turns every turn.
global.enemies[15] = ds_map_create();
ds_map_add(global.enemies[15], "type", "Boss");
ds_map_add(global.enemies[15], "displayName", "The true pit");
ds_map_add(global.enemies[15], "sprite", sOldMoon2);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", sOldMoon2_atk);
ds_map_add(attacks[|0], "type", targetting.TARGETALL);
ds_map_add(attacks[|0], "displayName", "Eye of the gaping maw");
ds_map_add(attacks[|0], "desc", "Luck Down");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sOldMoon2_atk);
attacks[|1] = ds_map_create();
ds_map_add(attacks[|1], "id", 1);
ds_map_add(attacks[|1], "sprite", sOldMoon2_atk);
ds_map_add(attacks[|1], "targetDead", true);
ds_map_add(attacks[|1], "displayName", "From the void it hungers");
ds_map_add(attacks[|1], "desc", "Spawn a single tentacle");
ds_map_add(attacks[|1], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "targetAllyPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|1], "weight", 1);
ds_map_add(attacks[|1], "atksprite", sOldMoon2_atk);
attacks[|2] = ds_map_create();
ds_map_add(attacks[|2], "id", 2);
ds_map_add(attacks[|2], "sprite", sOldMoon2_atk);
ds_map_add(attacks[|2], "displayName", "Rend of the cosmic god");
ds_map_add(attacks[|2], "desc", "Heavy Attack");
ds_map_add(attacks[|2], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|2], "weight", 1);
ds_map_add(attacks[|2], "atksprite", sOldMoon2_atk);
attacks[|3] = ds_map_create();
ds_map_add(attacks[|3], "id", 3);
ds_map_add(attacks[|3], "sprite", sOldMoon2_atk);
ds_map_add(attacks[|3], "type", targetting.TARGETALL);
ds_map_add(attacks[|3], "displayName", "The one true gamer");
ds_map_add(attacks[|3], "desc", "Cleave all units, chance to lower DEX");
ds_map_add(attacks[|3], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|3], "weight", 1);
ds_map_add(attacks[|3], "atksprite", sOldMoon2_atk);
ds_map_add(global.enemies[15], "attacks", attacks);
ds_map_add(global.enemies[15], "stats", [70, 0, 0, 9, 10, 8, 1, 1, 1]);

//Tentacle Monster
global.enemies[16] = ds_map_create();
ds_map_add(global.enemies[15], "type", "Boss");
ds_map_add(global.enemies[15], "displayName", "Tentacle of the void");
ds_map_add(global.enemies[15], "sprite", sTentacle);
attacks = ds_list_create();
attacks[|0] = ds_map_create();
ds_map_add(attacks[|0], "id", 0);
ds_map_add(attacks[|0], "sprite", -1);
ds_map_add(attacks[|0], "type", targetting.TARGETALL);
ds_map_add(attacks[|0], "displayName", "Drag to the abyss");
ds_map_add(attacks[|0], "desc", "Attack");
ds_map_add(attacks[|0], "charPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "targetPosition", [1, 1, 1, 1]);
ds_map_add(attacks[|0], "weight", 1);
ds_map_add(attacks[|0], "atksprite", sTentacle_atk);
ds_map_add(global.enemies[16], "attacks", attacks);
ds_map_add(global.enemies[16], "stats", [7, 0, 0, 2, 2, 9, 4, 6, 5]);

var i;
for (i=0; i < array_length_1d(global.characters); i++) {
	ds_map_add(global.characters[i], "id", i);
}
for (i=0; i < array_length_1d(global.enemies); i++) {
	ds_map_add(global.enemies[i], "id", i);
}

global.order = [1, 6, 0, 6];
global.enemyOrder = [1, 4, 4, 1];
global.selected = -1;
global.attackSelected = -1;
global.newSelect = false;

// Set random seed
randomize();

show_debug_message("Hello, world!")
room_goto_next();
