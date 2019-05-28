// PG-13 Username
// @desc deal_damage(damage, character, target);

var damage = argument0;
var character = argument1;
var target = argument2;

if (target.riposte >= 0) {
	// Riposte always does 3 damage
	character.current_hp -= 3;
	if (character.current_hp <= 0) {
		character.dead = true;
		die(character);
	}
}

damage = clamp(damage - target.shield, 0, damage);

target.current_hp -= damage;

if (target.current_hp <= 0) {
	target.dead = true;
	die(target);
}