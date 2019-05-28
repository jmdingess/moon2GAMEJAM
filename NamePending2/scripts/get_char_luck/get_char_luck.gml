// PG-13 Username
// @desc get_char_luck(character)
// returns their luck

var character = argument0;

var stats = character.myStats
var luck = stats[@ 6];

if (is_undefined(luck)) {
	luck = 0;
}
return luck;