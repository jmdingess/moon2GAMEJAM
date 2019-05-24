/// @description Insert description here
// You can write your code in this editor
x = oGodGamer.x;
y = oGodGamer.y;
direction = point_direction(x, y, mouse_x, mouse_y);

if (direction > 90) && (direction < 270) image_yscale = -1;
else image_yscale = 1;

image_angle = direction;



var mouseb;
mouseb = mouse_check_button_pressed(mb_left);

if (mouseb && current_cd == 0) {
	current_cd = cooldown;
	current_delay = startup;
}

if (current_delay == 0 && current_cd != 0) {
	length = 100;
	bulletspeed = 5;
	with (instance_create_layer(x+lengthdir_x(length, direction), y+lengthdir_y(length, direction), "Projectiles", oMightyShout))
	{
		direction = other.direction;
		speed = other.bulletspeed;
	}
}



if (current_delay == 0) {
	current_cd = max(0, current_cd - 1)
}
current_delay = max(0, current_delay - 1)