/// @description Insert description here
// You can write your code in this editor

// Draw our sprite if we have one
var mySprite = myCharacter[? "sprite"];
if is_undefined(mySprite) {
	sprite_index = sEmptyChar;
}
else {
	sprite_index = mySprite;
}
if (mySprite != -1)
{
	draw_self();
}