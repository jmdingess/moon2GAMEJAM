//Ellipses
// Get direction
dir = point_direction(0,0, xaxis, yaxis);

//get length 
if (xaxis == 0) && (yaxis== 0) {
len = 0;
}  
else {
	len = spd;
}/*
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

var mapEnemies;
var i;
for (i=0; i < instance_count(oMap_enemy); i++) {
	mapEnemies[i] = instance_find(oMap_enemy, i);
	mapEnemies[i].ID = i;
}

//Enemy Collision for world 1 enemies
if (place_meeting(x, y+vspd, oMap_enemy)){
	if(!place_meeting(x, y+sign(vspd), oMap_enemy)){
		var enemy = place_meeting(x, y+(vspd), oMap_enemy);
		battleID = enemy.ID;
		object_set_visible(enemy,false);
		global.enemyOrder = [1, 2, 3, 4];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}
if (place_meeting(x+hspd, y, inst_574D99F2)){
	if(!place_meeting(x+sign(hspd), y, inst_574D99F2)){
		object_set_visible(inst_574D99F2,false);
		global.enemyOrder = [1, 2, 3, 4];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}
//Enemy Collision for world 1 enemies
if (place_meeting(x, y+vspd, oMap_enemy)){
	if(!place_meeting(x, y+sign(vspd), oMap_enemy)){
		object_set_visible(inst_1809869D,false);
		global.enemyOrder = [6, 9, 0, 0];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}
if (place_meeting(x+hspd, y, oMap_enemy)){
	if(!place_meeting(x+sign(hspd), y, oMap_enemy)){
		object_set_visible(inst_1809869D,false);
		global.enemyOrder = [6, 9, 0, 0];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}
//Enemy Collision for world 1 enemies
if (place_meeting(x, y+vspd, oMap_enemy)){
	if(!place_meeting(x, y+sign(vspd), oMap_enemy)){
		object_set_visible(inst_1809869D,false);
		global.enemyOrder = [6, 9, 0, 0];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}
if (place_meeting(x+hspd, y, oMap_enemy)){
	if(!place_meeting(x+sign(hspd), y, oMap_enemy)){
		object_set_visible(inst_1809869D,false);
		global.enemyOrder = [6, 9, 0, 0];
		global.selected = -1;
		global.attackSelected = -1;
		global.newSelect = false;
		room_goto_previous();
	}
}

	
*/