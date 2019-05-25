/// @description Insert description here
// You can write your code in this editor

var mouse = mouse_check_button_pressed(mb_left);
var esc = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_pause));

// If they click on nothing, deselect all
if (mouse && !position_meeting(mouse_x, mouse_y, oCharacter) && !position_meeting(mouse_x, mouse_y, oEnemy) && !position_meeting(mouse_x, mouse_y, oAttack)) {
	show_debug_message("I'm deselecting!");
	global.attackSelected = -1;
	global.enemySelected = -1;
	global.selected = -1;
	var selectionBox = instance_find(oSelectionBox, 0);
	if (selectionBox != noone) {
		selectionBox.visible = false;
	}
	var selectionBar = instance_find(oSelectionBar, 0);
	if (selectionBar != noone) {
		selectionBar.visible = false;
	}
	var i;
	for (i = 0; i < instance_number(oInvalidAttack); i++) {
		var invalidAttack = instance_find(oInvalidAttack, i);
		invalidAttack.visible = false;
	}
}

if (esc) {
	// Should pause, but...
	game_end();
}