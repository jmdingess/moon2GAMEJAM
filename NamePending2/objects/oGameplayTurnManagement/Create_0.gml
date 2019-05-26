/// @description Insert description here
// You can write your code in this editor

var characterInits;
var enemyInits;


var i;
for (i = 0; i < array_length_1d(global.order); i++) {
	if (global.order[i] == 0) {
		characterInits[i] = -1;
		continue;
	}
	var charMap = global.characters[global.order[i]];
	var charStats = charMap[? "stats"];
	characterInits[i] = turn_calc(charStats[7], charStats[6]);
	
	if (global.enemyOrder[i] == 0) {
		enemyInits[i] = -1;
		continue;
	}
	var enemyMap = global.characters[global.enemyOrder[i]];
	var enemyStats = enemyMap[? "stats"];
	enemyInits[i] = turn_calc(enemyStats[7], enemyStats[6]);
}