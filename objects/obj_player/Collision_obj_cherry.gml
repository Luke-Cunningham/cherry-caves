/// @description Insert description here
// You can write your code in this editor

score += 1;
global.cherries += 1;
other.effect_create_above(ef_firework, x, y, .4, c_red);
instance_destroy(other);
audio_play_sound(snd_cherry, 5, false);

if (room == Room2) {
	frenzy = true;
	alarm[1] = room_speed * 5;
	audio_stop_sound(snd_frenzy);
	audio_play_sound(snd_frenzy, 1, true);
}
