/// @description Insert description here
// You can write your code in this editor

if (visible and place_meeting(x, y, oPlayermodel)) {
	visible = false;
	global.enemyOrder = myStageOrder;
	global.battleBackground = background;
	audio_stop_all();
	audio_play_sound(battleMusic, 1, true);
	room_goto(battleRoom);
}