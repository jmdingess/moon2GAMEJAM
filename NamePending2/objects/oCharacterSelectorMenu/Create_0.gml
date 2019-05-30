/// @description Insert description here
// You can write your code in this editor
name_list = ds_list_create();
var i;
//grab the names
for(i = 1; i < array_length_1d(global.characters); i++)
{
	//var tempChar = global.characters[i];
	ds_list_add(name_list, global.characters[i]);
}
//ds_list_add(name_list, "Confirm");
space = 64;
mpos = 0;