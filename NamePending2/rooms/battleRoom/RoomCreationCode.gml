// set background

if (! is_undefined(global.battleBackground)) {
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.battleBackground);
}