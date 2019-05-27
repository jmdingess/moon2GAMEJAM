// PG-13 Usermame
// @desc attack_message(text, x, y);
// Displays the attack message on attack

var gameplayManager = instance_find(oGameplayTurnManagement, 0);
gameplayManager.attackMessage = argument0;
gameplayManager.attackMessage_x = argument1;
gameplayManager.attackMessage_y = argument2;