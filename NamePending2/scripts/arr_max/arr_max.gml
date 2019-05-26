// PG-13 Username
// @desc arr_max(array)
// gets the max value from an array - how does gamemaker seriously not have a function for this

var i;
var maxValue = argument0[0];
for (i=1; i < array_length_1d(argument0); i++) {
	if maxValue < argument0[i] {
		maxValue = argument0[i];
	}
}
return maxValue;