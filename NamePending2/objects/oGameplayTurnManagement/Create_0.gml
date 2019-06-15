/// @description Insert description here
// You can write your code in this editor

// Create an array listing the possible target arrows for use later
for (i = 0; i < instance_number(oPossibleTarget); i++) {
	possibleTargets[i] = instance_find(oPossibleTarget, i);
}

// For suicide attack
charToKill = -1;

// For moving characters AFTER attacks
charToMove = -1;
spaces = -1;

// For showing attacks off
oldSprite = -1;
oldTargetSprite = -1;
atkSprite = -1;
target = -1;
targetMap = -1;
atkName = "";
drawText = false;
showAttack = false;
attackMessage = "";
attackMessage_x = -1;
attackMessage_y = -1;
dmg = 0;

// This code was written at 2 AM and we're low on time so I can't rewrite it
// It finds turn order
var characterInits;
var enemyInits;

var i;
for (i = 0; i < array_length_1d(global.order); i++) {
	if (global.order[i] <= 0) {
		characterInits[i] = -1;
	}
	else {
		var charMap = global.characters[global.order[i]];
		var charStats = charMap[? "stats"];
		characterInits[i] = turn_calc(charStats[7], charStats[6]);
	}
	
	if (global.enemyOrder[i] <= 0) {
		enemyInits[i] = -1;
	}
	else {
		var enemyMap = global.enemies[global.enemyOrder[i]];
		var enemyStats = enemyMap[? "stats"];
		enemyInits[i] = turn_calc(enemyStats[7], enemyStats[6]);
	}
}

global.turnOrderSize = 0;
global.turnOrder = [];

highestInit = max(arr_max(characterInits), arr_max(enemyInits), -1);
while highestInit >= 0 {
	for (i=0; i < array_length_1d(characterInits); i++) {
		if characterInits[i] == highestInit {
			global.turnOrder[global.turnOrderSize] = instance_find(oCharacter, i);
			global.turnOrderSize++;
			characterInits[i] = -1;
		}
	}
	for (i=0; i < array_length_1d(enemyInits); i++) {
		if enemyInits[i] == highestInit {
			global.turnOrder[global.turnOrderSize] = instance_find(oEnemy, i);
			global.turnOrderSize++;
			enemyInits[i] = -1;
		}
	}
	highestInit = max(arr_max(characterInits), arr_max(enemyInits), -1);
}

// Select whoever goes first, have them take a turn
global.selected = global.turnOrder[0];
global.turn = 0;
global.newSelect = true;