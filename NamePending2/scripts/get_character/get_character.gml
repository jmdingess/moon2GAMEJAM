// PG-13 Username
// @desc get_character(objType, position)

var character = instance_find(argument0, argument1);
if character.dead or character.sprite_index == sEmptyChar or character.sprite_index == -1 {
	return -1;
}
return character;