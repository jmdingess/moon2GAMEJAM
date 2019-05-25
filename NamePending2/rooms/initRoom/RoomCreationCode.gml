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
ds_map_add(attacks[0], "displayName", "Placeholder attack");
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