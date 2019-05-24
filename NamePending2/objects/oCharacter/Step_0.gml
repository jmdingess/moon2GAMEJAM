/// @description Insert description here
// You can write your code in this editor

var mouse;
mouse = mouse_check_button_pressed(mb_left);

if (global.selected != myID && mouse && position_meeting(mouse_x, mouse_y, id))
{
	global.selected = myID;
	var selectionBar;
	selectionBar = instance_find(oSelectionBar, 0)
	if (selectionBar != noone) {
		selectionBar.x = self.x;
		selectionBar.y = self.y;
		selectionBar.visible = true; 
	}
	
	myAttacks = myCharacter[? "attacks"];
	var i = -1;
	for (i = 0; i < array_length_1d(attackButtons); i++) {
		attackButtons[i].ID = myAttacks[? "id"];
		attackButtons[i].sprite_index = myAttacks[? "sprite"];
		attackButtons[i].visible = true;
	}
}