/// @description Insert description here
// You can write your code in this editor

if dead or is_undefined(enemyMap[? "sprite"])  {
	sprite_index = sEmptyChar;
}
else {
	sprite_index = enemyMap[? "sprite"];
}
if (sprite_index != -1) {
	draw_self()
}