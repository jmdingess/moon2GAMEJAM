// PG-13 Username
// @desc show_attack(character, sprite, targets)
// show attacking animation

// character is the instance making the attack
// sprite is the attack sprite
// targets is all the instances being targetted; if multiple provide as additional params

// THIS CODE DOESNT WORK CURRENTLY. DON'T CALL IT.

var character = argument0;
var sprite = argument1;
var targetCount = argument_count - 2;
var targetArray = argument2;

var old_x = character.x;

// Camera stuff, scrapped for now
/*
// Store screen size
var ideal_w = display_get_width();
var ideal_h = display_get_height();

// Make camera object
var cam = camera_create();
camera_set_view_size(cam, ideal_w, ideal_h);
camera_set_view_pos(cam, 0, 0);

var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);

view_set_camera(0, cam);

view_w = lerp(view_w, ideal_w*0.5, 0.2);
view_h = lerp(view_h, ideal_h*0.5, 0.2);

camera_set_view_size(cam, view_w, view_h)
surface_resize(application_surface, ideal_w, ideal_h);

camera_set_view_pos(cam, character.x-view_w/2, character.y-view_h/2);
*/

// zoom in and wait a few secs
character.sprite_index = sprite;

/*
var i;
for (i = 0; i < targetCount; i++) {
	var targetMap = -1;
	if (targetArray[@ i].object_index == oCharacter) {
		targetMap = targetArray[@ i].myCharacter;
	}
	else {
		targetMap = targetArray[@ i].enemyMap;
	}
	if (is_undefined(targetMap) or targetMap == -1) {
		show_error("couldn't find target map", true)
	}
	var hitSprite = targetMap[? "hit"];
	if (!is_undefined(hitSprite)) {
		sprite_index = hitSprite;
	}
}
*/

