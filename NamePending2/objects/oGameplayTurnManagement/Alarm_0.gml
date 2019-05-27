/// @description Handle AttackAnimation
// You can write your code in this editor

drawText = false;
atkName = "";
attackMessage = "";
attackMessage_x = -1;
attackMessage_y = -1;

if (!is_undefined(oldSprite) and oldSprite != -1) {
	var charMap = -1;
	if (global.selected.object_index = oCharacter) {
		charMap = global.selected.myCharacter;
	}
	else {
		charMap = global.selected.enemyMap;
	}
	charMap[? "sprite"] = oldSprite
	global.selected.sprite_index = oldSprite;
	oldSprite = -1;
	atkSprite = -1;
}

if (oldTargetSprite != -1) {
	targetMap[? "sprite"] = oldTargetSprite;
	target.sprite_index = oldTargetSprite;
	oldTargetSprite = -1;
}


// Pass turn
global.turn++;
if global.turn >= array_length_1d(global.turnOrder) {
	global.turn = 0;
}
global.selected = global.turnOrder[global.turn];
global.newSelect = true;