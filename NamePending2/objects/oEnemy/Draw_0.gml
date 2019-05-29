/// @description Insert description here
// You can write your code in this editor

if dead or is_undefined(enemyMap[? "sprite"])  {
	sprite_index = sEmptyChar;
}
else {
	sprite_index = enemyMap[? "sprite"];
}
if (sprite_index != -1) {
	draw_self()
	if (sprite_index != sEmptyChar) {
		draw_healthbar(x+40, y-40, x+248, y-30, (current_hp/max_hp)*100.0, c_black, c_red, c_lime, 0, false, true);
		var off = 0;
		if (stun != 0) {
			draw_sprite_ext(sConditionDazed, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
		if (bleed != 0) {
			draw_sprite_ext(sConditionBleed, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
		if (riposte != 0) {
			draw_sprite_ext(sConditionRiposte, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
		if (shield != 0) {
			draw_sprite_ext(sConditionShield, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
		var i;
		var buffed = false;
		var debuffed = false;
		for (i=0; i < array_length_1d(statBoosts); i++) {
			if (statBoosts[i] < 0) {
				debuffed = true;
			}
			if (statBoosts[i] > 0) {
				buffed = true;
			}
		}
		if (buffed) {
			draw_sprite_ext(sConditionBuff, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
		if (debuffed) {
			draw_sprite_ext(sConditionDebuff, -1, x+40+off, y-80, 0.5, 0.5, 0, c_white, 1);
			off += 40;
		}
	}
}