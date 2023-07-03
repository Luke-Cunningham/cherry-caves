/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y + spd*dir, obj_block)) {
	sprite_index = spr_octopus_purple_0;
	
	if (image_angle == 180 and !stuck) {
		image_angle = 0;
	} else if (image_angle == 0 and !stuck) {
		image_angle = 180;
	}
	stuck = true;
	spd = 0;
	alarm[1] = room_speed * 3;
}

if(!stuck) {
	y += spd * dir;
}

