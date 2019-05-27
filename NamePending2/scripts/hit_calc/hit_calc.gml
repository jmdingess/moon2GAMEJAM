///frostbyt#6969
///hit_calc(ACC, LCK)
//
//
// Calculates whether an attack was successufl or not
// Returns true if the attack was successful
// false otherwise
//
// hit_chance nonnegative float/double in range 0.0 - 1.0


//TODO: add input checking
var hit_chance, max_chance, hit_score;

//make sure we use a new seed each time
randomize()





hit_chance = (random(argument0)) / random_range(1, argument1);
max_chance = 1.0 / hit_chance;
var rand = random(1.0)
if(abs(rand - 0.5) <= 0.1)
{
	hit_score = (1.0 - random(1.0)) * (max_chance - 1.0) + 1.0;
}
else
{
	hit_score = random(1.0) * (max_chance - 1.0) + 1.0;	
}

//this might be buggy, I'm not sure how DM handles float/double comparison - frostbyt
//loose threshold for now
if(abs((1.0/hit_score) - hit_chance) <= 0.1)
{
	return true;	
}
else
{
	return false;	
}