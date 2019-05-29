/// @description Insert description here
// You can write your code in this editor
var mov = 0;
mov -= max(keyboard_check_pressed(vk_up),keyboard_check_pressed(ord("W")));
mov += max(keyboard_check_pressed(vk_down),keyboard_check_pressed(ord("S")));

if(mov != 0)
{
	mpos += mov;
	if(mpos < 0)
	{
		mpos = ds_list_size(name_list) - 1;	
	}

	if(mpos > ds_list_size(name_list) - 1)
	{
		mpos = 0;	
	}
}
var push;
push = max(keyboard_check_released(vk_enter),keyboard_check_released(vk_shift),keyboard_check_released(vk_space),0);
if(push == 1)
{
	party_select(global.charList);	
}