/// @description Insert description here
// You can write your code in this editor

if (frenzy) {
	effect_create_above(ef_explosion, x, y, 1, c_blue);
	instance_destroy(other);
	audio_play_sound(snd_squash, 3, false);
	
} else {
	// kill octopus
	if ((y + sprite_height/2) < other.y) {
		effect_create_above(ef_explosion, x, y, 1, c_blue);
		instance_destroy(other);
		force_jump = true;
		audio_play_sound(snd_squash, 1, false);
		
	// berry takes damage
	} else {
		effect_create_above(ef_explosion, x, y, 3, c_red);
		audio_play_sound(snd_damage, 1, false);
		global.lives -= 1;
		x = 224;
		y = 800;
	}
}