/// @description Insert description here
// You can write your code in this editor

var mouse;
mouse = mouse_check_button_pressed(mb_left);

if (timeout == 0 && mouse && position_meeting(mouse_x, mouse_y, self.id))
{
	sprite_index = sClickedButton;
	audio_play_sound(soAttack, 1, 1);
	timeout = 50;
	show_debug_message(myID);
}

timeout = max(0, timeout - 1);

if (timeout == 0) {
	sprite_index = sUnclickedButton;
}