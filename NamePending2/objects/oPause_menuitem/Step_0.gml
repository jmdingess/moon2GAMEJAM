/// @description Insert description here
// You can write your code in this editor

var mouse = mouse_check_button_pressed(mb_left);

if (mouse and position_meeting(mouse_x, mouse_y, id)) {
	if myPos == 0 {
		// Main menu button
		audio_stop_all();
		room_goto(2);
	}
	if myPos == 1 {
		// Exit Button
		room_goto(4);
	}
	if myPos == 2{
		// Change party ends game until frosty gets the party change function rolling

		game_end();
	}
}