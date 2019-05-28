if(ds_list_size(argument0) < 4)
{
	switch(mpos)
	{
		case 0: //not valid
		break;
		case 8: //confirm selection
		{
			var i;
			for(i = 0; i < ds_list_size(argument0); i++)
			{
				var charTemp = argument0[|i];
				global.order[i] = charTemp[? "id"];
			}
			ds_list_clear(argument0);
			room_goto_next();
			break;
		}
		default: //all others
		{
			var charTemp = global.characters[mpos];
			var idx = ds_list_find_index(argument0,charTemp);
			if(idx != -1)
			{
				break;
			}
			else
			{
				ds_list_add(argument0,charTemp);	
			}
			break;	
		}
		
	}
}
else
{
	var i;
	for(i = 0; i < ds_list_size(argument0) - 1; i++)
	{
		var charTemp = argument0[|i];
		global.order[i] = charTemp[? "id"];			
	}
	ds_list_clear(argument0);
	room_goto(3);
}