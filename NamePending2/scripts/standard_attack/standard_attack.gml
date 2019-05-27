// PG-13 Username
// @desc standard_attack(acc, off_stat_main, off_stat_sup, attackPower, target_luck, target)
// returns true if did any damage, false otherwise

// Deals damage in range (off_stat_main, off_stat_main+off_stat_sup)*attackPower

var acc = argument0;
var off_stat_main = argument1;
var off_stat_sup = argument2;
var attackPower = argument3;
var target_luck = argument4;
var target = argument5;

// Check if hit
if (hit_calc((acc - target_luck)/20.0)) {
	// Hit
	dmg = irandom_range(floor(off_stat_main*attackPower), ceil((off_stat_main+off_stat_sup)*attackPower));
	target.current_hp -= dmg;
	if (target.current_hp <= 0) {
		target.dead = true;
	}
	return dmg
}
// Miss
return 0

// I guess they never miss, huh?