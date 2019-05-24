/// @description Insert description here
// You can write your code in this editor
myID = -1;
myCharacter = global.characters[0];

var i = -1;
for (i = 0; i < instance_number(oAttack); i++) {
	attackButtons[i] = instance_find(oAttack, i);
}