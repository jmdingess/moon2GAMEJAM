// PG-13 Username
// @desc arr_find(array, value)
// gets the index of the first instance of value in an array. If not found, -1.
//	how does gamemaker seriously not have a function for this

var i=0;
while i < array_length_1d(argument0) && argument0[i] != argument1 {
	i++;
}
if (i == array_length_1d(argument0)) {
	return -1;
}
return i;