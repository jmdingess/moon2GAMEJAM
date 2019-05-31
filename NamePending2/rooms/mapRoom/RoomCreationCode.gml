// Give each oMapEnemy its proper stage and stageEnemies

// Define global.completed if not defined
if (global.completed == -1) {
	var i;
	for (i=0; i < instance_number(oMapEnemy); i++) {
		global.completed[i] = false;
	}
}

var i;
var stages;
for (i=0; i < instance_number(oMapEnemy); i++) {
	stages[i] = instance_find(oMapEnemy, i);
	stages[i].ID = i;
}

// Reset global values needed for battles
global.selected = -1;
global.attackSelected = -1;
global.newSelect = false;

// If not defeated; set that stage to complete and spawn the character there.
if (global.stage != -1 and !global.defeated) {
	global.completed[global.stage] = true;
	var player = instance_find(oPlayermodel, 0);
	player.x = stages[global.stage].x;
	player.y = stages[global.stage].y;
}

// Set all completed stages to invisible
for (i=0; i < array_length_1d(stages); i++) {
	if (global.completed[i]) {
		stages[i].visible = false;
	}
}

/*
Characters
	0: Empty
	1: Moon
	2: Tesla
	3: Suzuki Teriyaki
	4: Purple Lady Face
	5: Aniki
	6: Eddie
	7: Lord Barwick
	
Enemies
	0: Empty
	1: moon2S
	2: Prime Pleb
	3: NaM
	4: moon2N
	5: Weeb
	6: Troglodyte
	7: moon2A
	8: poopSnail
	9: Wabbit
	10: Doar
	11: DEVox
	
Bosses
	12: Corporation
	13: Ricardo
	14: The old moon 
	15: The true pit (old moon2)
	16: Tentacle of the void
*/

// myStageOrder - the order of the enemies in this stage using the enemy IDs above
// background - the battle background sprite to use on this stage
// battleMusic - the music to play when this battle begins
// sprite_index - the sprite the MAP icon uses

// For large enemies, fill in unusable spaces with -1. The large enemy should be in front of the -1s.
// i.e. to fight a poopSnail in front of a NaM, it'd be [8, -1, 3, 0] because poopSnail uses 2 slots.

// Stage 0
stages[0].myStageOrder = [6, 9, 0, 0]; // Troglodyte, Rabbit
stages[0].background = sBackgroundForest; // Should be marsh according to doc
stages[0].battleMusic = soWorld1_fight;
stages[0].sprite_index = sMap_trog;

// Stage 1
stages[1].myStageOrder = [6, 6, 9, 0]; // Trog, Trog, Rabbit
stages[1].background = sBackgroundForest; // Should be marsh according to doc
stages[1].battleMusic = soWorld1_fight;
stages[1].sprite_index = sMap_trog;

// Stage 2
// A.K.A. Fuck this level
stages[2].myStageOrder = [3, 3, 3, 3] // NaM, NaM, NaM, NaM
stages[2].background = sBackgroundForest;
stages[2].battleMusic = soWorld1_fight;
stages[2].sprite_index = sMap_trog; // Would be cool to get a one-use sMap_nam


// Stage 3
stages[3].myStageOrder = [6, 2, 2, 0] // PrimePleb, PrimePleb, Trog
stages[3].background = sBackgroundKingsRow;
stages[3].battleMusic = soWorld1_fight;
stages[3].sprite_index = sMap_trog; 

// Stage 4
stages[4].myStageOrder = [12, 0, 0, 0] // Sponsor
stages[4].background = sBackgroundKingsRow;
stages[4].battleMusic = soWorld1_fight;
stages[4].sprite_index = sMap_sponsor; 


// Stage 5
stages[5].myStageOrder = [5, 5, 9, 3] // Weebs, Weebs, Trog, NaM
stages[5].background = sBackgroundVariety;
stages[5].battleMusic = soWorld2_fight;
stages[5].sprite_index = sMap_gums; 

// Stage 6
stages[6].myStageOrder = [5, 2, 6, 9] // Weebs, PrimePleb, Rabbit, Trog
stages[6].background = sBackgroundVariety;
stages[6].battleMusic = soWorld2_fight;
stages[6].sprite_index = sMap_gums; 

// Stage 7
stages[7].myStageOrder = [11, 11, 8, 0] //Fox, Fox, PoopSnail
stages[7].background = sBackgroundClub;
stages[7].battleMusic = soWorld2_fight;
stages[7].sprite_index = sMap_gums; 

// Stage 8
stages[8].myStageOrder = [11, 10, 10, 5] //Fox, Doar, Doar, Weebs
stages[8].background = sBackgroundClub;
stages[8].battleMusic = soWorld2_fight;
stages[8].sprite_index = sMap_gums; 

// Stage 9
stages[9].myStageOrder = [13, 0, 0, 0] //Ricardo
stages[9].background = sBackgroundClub;
stages[9].battleMusic = soWorld2_fight; //need to add ricardo boss fight music
stages[9].sprite_index = sMap_Ricardo; 

//etc