///frostbyt#6969
///hit_calc(hit_chance)
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

hit_chance = argument0;
max_chance = 1.0 / hit_chance;

if(random(1.0) < 0.5)
{
	hit_score = (1.0 - random(1.0)) * (max_chance - 1.0) + 1.0;
}
else
{
	hit_score = random(1.0) * (max_chance - 1.0) + 1.0;	
}

//this might be buggy, I'm not sure how DM handles float/double comparison - frostbyt
if(floor((1.0/hit_score) - hit_chance) == 0)
{
	return true;	
}
else
{
	return false;	
}