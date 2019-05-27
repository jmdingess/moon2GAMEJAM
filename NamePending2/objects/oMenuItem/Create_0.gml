/// @description Insert description here
// You can write your code in this editor

// Find my position by order in which we are listed in room
var i = instance_number(oMenuItem) - 1;
while (instance_find(oMenuItem, i) != self.id && 0 < i)
{
	i--;
}
myPos = i;