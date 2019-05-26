//Ellipses
//turn_calc(SPD, LCK)
//
//
//
var initiative, char_speed, char_luck;

char_speed = argument0;
char_luck = argument1;
initiative  = (char_speed * char_luck) + random_range(1,20);
return initiative;