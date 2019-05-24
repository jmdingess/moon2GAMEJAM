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
attacks[1] = ds_map_create();
ds_map_add(attacks[0], "id", 1);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[2] = ds_map_create();
ds_map_add(attacks[0], "id", 2);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[3] = ds_map_create();
ds_map_add(attacks[0], "id", 3);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[4] = ds_map_create();
ds_map_add(attacks[0], "id", 4);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[5] = ds_map_create();
ds_map_add(attacks[0], "id", 5);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[6] = ds_map_create();
ds_map_add(attacks[0], "id", 6);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
attacks[7] = ds_map_create();
ds_map_add(attacks[0], "id", 7);
ds_map_add(attacks[0], "sprite", -1);
ds_map_add(attacks[0], "displayName", "Placeholder attack");
ds_map_add(global.characters[0], "attacks", attacks);
ds_map_add(global.characters[0], "attackSelected", [0, 1, 2, 3]);

// god gamer
global.characters[1] = ds_map_create();
ds_map_add(global.characters[1], "type", "godGamer");
ds_map_add(global.characters[1], "displayName", "God Gamer");
ds_map_add(global.characters[1], "sprite", sGodGamer);

// alchemist
global.characters[2] = ds_map_create();
ds_map_add(global.characters[2], "type", "alchemist");
ds_map_add(global.characters[2], "displayName", "Alchemist");
ds_map_add(global.characters[2], "sprite", sAlchemist);


global.order = [1, 2, 0, 2];

room_goto_next();