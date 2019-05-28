//Ellipses
// Get direction
dir = point_direction(0,0, xaxis, yaxis);

//get length 
if (xaxis == 0) && (yaxis== 0) {
len = 0;
}  
else {
	len = spd;
}
//get speed variables
hspd = lengthdir_x(len, dir); 
vspd = lengthdir_y(len, dir);

//horizontal collisions
if (place_meeting(x+hspd, y, oWall)){
	while(!place_meeting(x+sign(hspd), y, oWall)){
		x+= sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x+hspd, y, oWall1)){
	while(!place_meeting(x+sign(hspd), y, oWall1)){
		x+= sign(hspd);
	}
	hspd = 0;
}
x+= hspd;

//vertical collisions
if (place_meeting(x, y+vspd, oWall)){
	while(!place_meeting(x, y+sign(vspd), oWall)){
		y+= sign(vspd);
	}
	vspd = 0;
}
if (place_meeting(x, y+vspd, oWall1)){
	while(!place_meeting(x, y+sign(vspd), oWall1)){
		y+= sign(vspd);
	}
	vspd = 0;
}
y+= vspd;
//Enemy Collision for world 1 enemies
if (place_meeting(x, y+vspd, oMap_enemy)){
	if(!place_meeting(x, y+sign(vspd), oMap_enemy)){
		object_set_visible(inst_574D99F2,false);
		room_goto_previous();
	}
}
if (place_meeting(x+hspd, y, oMap_enemy)){
	if(!place_meeting(x+sign(hspd), y, oMap_enemy)){
		object_set_visible(inst_574D99F2,false);
		room_goto_previous();
	}
}

	
