
var keyleft = keyboard_check(vk_left);
var keyright = keyboard_check(vk_right);
var jumping = keyboard_check(vk_space);
var keyup = keyboard_check(vk_up);
var keydown = keyboard_check(vk_down);

var move = keyright - keyleft;
var vmove = keydown - keyup;

hsp = spd * move;

if (move != 0) {
	image_xscale = move;
	if frenzy {
		sprite_index = spr_player_walk_f;
	} else {
		sprite_index = spr_player_walk;
	}
} else {
	if frenzy {
		sprite_index = spr_player_idle_f;
	} else {
		sprite_index = spr_player_idle;	
	}
}

// Horizontal collision with a block.
if (place_meeting(x + hsp, y, obj_block)) {
	while (!place_meeting(x + sign(hsp), y, obj_block)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Vertical collision with a block.
vsp += grv;
if (place_meeting(x, y + vsp, obj_block)) {
	while (!place_meeting(x, y + sign(vsp), obj_block)) {
		y += sign(vsp);
	}
	vsp = 0;
	grounded = true;
} else {
	grounded = false;
}

// platform collision
if (place_meeting(x, y + vsp, obj_platform)) {
	p_dir = obj_platform.dir;
	p_sp = obj_platform.spd;
	x += p_dir * p_sp;
	vsp = 0;
	grounded = true;
}

// Climbing logic.
if (place_meeting(x, y+1, obj_ladder)) {
	if (vmove < 0 || 
	(vmove == 0 && climbing) ||
	(vmove > 0 && place_meeting(x, y+sprite_height, obj_ladder))) {
		climbing = true;
	} else {
		climbing = false;
	}
} else {
	climbing = false;
}

if (climbing) {
	vsp = vmove * spd;
	if frenzy {
		sprite_index = spr_player_climb_f;
	} else {
		sprite_index = spr_player_climb;
	}
}

// Am I jumping?
if (grounded && jumping || force_jump) {
	force_jump = false;
	vsp -= (jspd + jspd_bounce);
	jspd_bounce = 0;
	grounded = false;
	if frenzy {
		sprite_index = spr_player_idle_f;
	} else {
		sprite_index = spr_player_idle;
	}
}

// Fall off world
if (y > room_height + 50) {
	global.lives -= 1;
	audio_play_sound(snd_damage, 1, false);
    x = 224;
	y = 800;
}

y += vsp;
