// Initialize Characters

// empty position; placeholder character.
global.characters[0] = ds_map_create();
ds_map_add(global.characters[0], "type", "empty");
ds_map_add(global.characters[0], "displayName", "If you see this something went wrong")
ds_map_add(global.characters[0], "sprite", -1);
var attacks;
attacks[0] = ds_map_create();
ds_map_add(attacks[0], "id", 0);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
ds_map_add(attacks[0], "Desc", "placeholder description");
ds_map_add(attacks[0], "charposition", [0, 0, 0, 0]);
ds_map_add(attacks[0], "targetposition", [0, 0, 0, 0]);
attacks[1] = ds_map_create();
ds_map_add(attacks[1], "id", 1);
ds_map_add(attacks[1], "sprite", -1);
ds_map_add(attacks[1], "displayName", "Placeholder attack");
attacks[2] = ds_map_create();
ds_map_add(attacks[2], "id", 2);
ds_map_add(attacks[2], "sprite", -1);
ds_map_add(attacks[2], "displayName", "Placeholder attack");
attacks[3] = ds_map_create();
ds_map_add(attacks[3], "id", 3);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "Placeholder attack");
ds_map_add(global.characters[0], "attacks", attacks);

// god gamer
global.characters[1] = ds_map_create();
ds_map_add(global.characters[1], "type", "godGamer");
ds_map_add(global.characters[1], "displayName", "God Gamer");
ds_map_add(global.characters[1], "sprite", sGodGamer);
var attacks;
attacks[0] = ds_map_create();
ds_map_add(attacks[0], "id", 0);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Ban Hammer");
ds_map_add(attacks[0], "Desc", "Attack an enemy with the power of chat moderation.");
ds_map_add(attacks[0], "charposition", [0, 0, 1, 1]);
ds_map_add(attacks[0], "targetposition", [1, 1, 0, 0]);
attacks[1] = ds_map_create();
ds_map_add(attacks[1], "id", 1);
ds_map_add(attacks[1], "sprite", -1);
ds_map_add(attacks[1], "displayName", "Suck my Dick");
ds_map_add(attacks[0], "Desc", "Attack an distant target with chance to stun.");
attacks[2] = ds_map_create();
ds_map_add(attacks[2], "id", 2);
ds_map_add(attacks[2], "sprite", -1);
ds_map_add(attacks[2], "displayName", "ShaShaa");
ds_map_add(attacks[0], "Desc", "Attack an enemy; gain riposte.");
attacks[3] = ds_map_create();
ds_map_add(attacks[3], "id", 3);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "BlapBlapp");
ds_map_add(attacks[0], "Desc", "Attack 2 random targets with a gat.");
attacks[4] = ds_map_create();
ds_map_add(attacks[3], "id", 4);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "Variety Stream");
ds_map_add(attacks[0], "Desc", "Attack enemy with the power of chat moderation.");
ds_map_add(global.characters[1], "attacks", attacks);

// Gaybriel
global.characters[1] = ds_map_create();
ds_map_add(global.characters[1], "type", "Party Member");
ds_map_add(global.characters[1], "displayName", "Gaybriel");
ds_map_add(global.characters[1], "sprite", sGaybriel);
var attacks;
attacks[0] = ds_map_create();
ds_map_add(attacks[0], "id", 0);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "RP spew");
ds_map_add(attacks[0], "Desc", "Targets 2 enemies with useless rant, lowers accuracy with chance to sleep");
attacks[1] = ds_map_create();
ds_map_add(attacks[1], "id", 1);
ds_map_add(attacks[1], "sprite", -1);
ds_map_add(attacks[1], "displayName", "Confusing backstory");
ds_map_add(attacks[0], "Desc", "Make no sense, cause confusion to target enemy.");
attacks[2] = ds_map_create();
ds_map_add(attacks[2], "id", 2);
ds_map_add(attacks[2], "sprite", -1);
ds_map_add(attacks[2], "displayName", "Self Destruction");
ds_map_add(attacks[0], "Desc", "Gaybriels ulimate sacrifice, deals alot of damage at the cost of Gaybriel");
attacks[3] = ds_map_create();
ds_map_add(attacks[3], "id", 3);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "LARP death blossom");
ds_map_add(attacks[0], "Desc", "Attacks all enemies with rubbet bullets, does minor damage.");
attacks[4] = ds_map_create();
ds_map_add(attacks[3], "id", 4);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "Life Steal");
ds_map_add(attacks[0], "Desc", "Target enemy, deals damage and heals Gaybriel.");
ds_map_add(global.characters[1], "attacks", attacks);

// Tesla Model S
global.characters[1] = ds_map_create();
ds_map_add(global.characters[1], "type", "Party Member");
ds_map_add(global.characters[1], "displayName", "Tesla Model S");
ds_map_add(global.characters[1], "sprite", stesla);
var attacks;
attacks[0] = ds_map_create();
ds_map_add(attacks[0], "id", 0);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Hit and Run");
ds_map_add(attacks[0], "Desc", "Run down target enemy with chance to bleed.");
attacks[1] = ds_map_create();
ds_map_add(attacks[1], "id", 1);
ds_map_add(attacks[1], "sprite", -1);
ds_map_add(attacks[1], "displayName", "Sentry Mode Protection");
ds_map_add(attacks[0], "Desc", "Defends ally target, increasing armor for the Tesla.");
attacks[2] = ds_map_create();
ds_map_add(attacks[2], "id", 2);
ds_map_add(attacks[2], "sprite", -1);
ds_map_add(attacks[2], "displayName", "Autopilot Assistance");
ds_map_add(attacks[0], "Desc", "Team evasion buff, insuring a safe drive in a Tesla");
attacks[3] = ds_map_create();
ds_map_add(attacks[3], "id", 3);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "Fully Retractable Sunroof");
ds_map_add(attacks[0], "Desc", "Increases style, which isn't a mechanic in our game, but also gives the parties accuracy.");
attacks[4] = ds_map_create();
ds_map_add(attacks[3], "id", 4);
ds_map_add(attacks[3], "sprite", -1);
ds_map_add(attacks[3], "displayName", "17 Inch Touchscreen Display");
ds_map_add(attacks[0], "Desc", "Target enemy, increase damage against target.");
ds_map_add(global.characters[1], "attacks", attacks);

// alchemist
global.characters[2] = ds_map_create();
ds_map_add(global.characters[2], "type", "alchemist");
ds_map_add(global.characters[2], "displayName", "Alchemist");
ds_map_add(global.characters[2], "sprite", sAlchemist);
var attacks;
attacks[0] = ds_map_create();
ds_map_add(attacks[0], "id", 0);
ds_map_add(attacks[0], "sprite", sUnclickedButton);
ds_map_add(attacks[0], "displayName", "Attack 1");
attacks[1] = ds_map_create();
ds_map_add(attacks[1], "id", 1);
ds_map_add(attacks[1], "sprite", sUnclickedButton);
ds_map_add(attacks[1], "displayName", "Attack 2");
attacks[2] = ds_map_create();
ds_map_add(attacks[2], "id", 2);
ds_map_add(attacks[2], "sprite", sUnclickedButton);
ds_map_add(attacks[2], "displayName", "Attack 3");
attacks[3] = ds_map_create();
ds_map_add(attacks[3], "id", 3);
ds_map_add(attacks[3], "sprite", sUnclickedButton);
ds_map_add(attacks[3], "displayName", "Attack 4");
ds_map_add(global.characters[2], "attacks", attacks);


global.order = [1, 2, 0, 2];
global.selected = -1
room_goto_next();
