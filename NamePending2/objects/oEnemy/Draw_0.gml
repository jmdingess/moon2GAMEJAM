/// @description Insert description here
// You can write your code in this editor

if dead or is_undefined(enemyMap[? "sprite"])  {
	sprite_index = sEmptyChar;
	dead = true;
}
else {
	sprite_index = enemyMap[? "sprite"];
}
if (sprite_index != -1) {
	draw_self()
}
else {
	dead = true;
}