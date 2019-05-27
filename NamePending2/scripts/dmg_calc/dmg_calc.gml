///frostbyt#6969
///dmg_calc(hit_chance, atk_min, atk_max)
//
// Calculates damage dealt by an attack
// Returns a non-zero integer representing total damage dealt if attack is successful
// Returns zero if the attack was not successful
//
// hit_chance chance of attack succeeding, expressed as float/double
// atk_min minimum damage dealt by attack if successful, integer
// atk_max maximum damage dealt by attack if successful, integer

//TODO: add input checking
var total_dmg;
var hit_chance = argument0;
var atk_min = argument1;
var atk_max = argument2;
//start with a new seed each time
randomize();

if(hit_calc(hit_chance))
{
	total_dmg = irandom_range(atk_min,atk_max);
	//this is just to debug for now
	//show_message("Did " + string(total_dmg) + " damage");
	return total_dmg;
}
else
{
	show_message("Attack failed");
	return 0;
}
