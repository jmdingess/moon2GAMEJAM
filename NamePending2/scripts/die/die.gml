// PG-13 Username
// @desc die(character)
show_debug_message("character died");

var character = argument0;
var i=global.turnOrderSize - 1;
while 0 <= i and global.turnOrder[i] != character {
	i--;
}
if i != -1 {
	if global.turn >= i {
		global.turn--;
	}
	i++;
	while i < global.turnOrderSize {
		global.turnOrder[i-1] = global.turnOrder[i];
		i++;
	}
	global.turnOrderSize--;
}

var allEnemiesDead = true;
var allCharactersDead = true;

var i = 0;
for (i=0; i < 4; i++) {
	var enemy = instance_find(oEnemy, i);
	var char = instance_find(oCharacter, i);
	if !enemy.dead {
		allEnemiesDead = false;
	}
	if !char.dead {
		allCharactersDead = false;
	}
}

if allCharactersDead {
	// Restart battle
	show_debug_message("All characters died");
	global.defeated = true;
	room_goto_next();
}
if allEnemiesDead {
	// Go to next battle
	show_debug_message("All enemies died");
	global.defeated = false;
	room_goto_next();
}