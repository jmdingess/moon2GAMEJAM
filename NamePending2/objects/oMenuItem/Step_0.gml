/// @description Insert description here
// You can write your code in this editor

var mouse = mouse_check_button_pressed(mb_left);

if (mouse and position_meeting(mouse_x, mouse_y, id)) {
	if myPos == 0 {
		// Start button
		audio_stop_all();
		room_goto_next();
	}
	if myPos == 1 {
		// Quit Button
		game_end();
	}
}