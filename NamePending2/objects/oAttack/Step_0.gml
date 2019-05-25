/// @description Insert description here
// You can write your code in this editor

var mouse;
mouse = mouse_check_button_pressed(mb_left);

// The timeout is a holdover from a previous thing I was messing with and isn't important

// If we aren't timed out and the mouse clicks and the mouse is over us
if (timeout == 0 && mouse && position_meeting(mouse_x, mouse_y, self.id))
{
	sprite_index = sClickedButton;
	audio_play_sound(soAttack, 1, 1); //lol Song is Exuma, the Obeah Man by Exuma. Should be removed cus copyright
	timeout = 50;
	show_debug_message(myID);
}

// Count down timer each step until 0
timeout = max(0, timeout - 1);

if (timeout == 0) {
	sprite_index = sUnclickedButton;
}
