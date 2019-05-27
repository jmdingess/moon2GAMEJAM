/// frostbyt
/// calculates effects of an attack
/// @desc atk_calc(character, target, attack_id)
// character the initiator of the attack
// target the target of the attack
// character may be a player or enemy
// target may be a player or enemy
// attack_id id of the attack being performed

var character = argument0;
var target = argument1;
var attack_id = argument2;

// if the character is a player
if(character.object_index == oCharacter)
{
	// if target is a player
	if(target.object_index == oCharacter)
	{
		
	}
	else
	{
		// otherwise is an enemy
	}
}
else
{
	if(character.object_index == oEnemy)
	{
		
	}
}