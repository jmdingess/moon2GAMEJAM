// PG-13 Usermame
// @desc attack_message(text);
// Displays the attack message on attack

var gameplayManager = instance_find(oGameplayTurnManagement, 0);
var textBox = instance_find(oPointMarker, 1);
gameplayManager.attackMessage = argument0;
gameplayManager.attackMessage_x = textBox.x;
gameplayManager.attackMessage_y = textBox.y;