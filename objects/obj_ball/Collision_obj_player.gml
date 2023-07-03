/// @description Insert description here
// You can write your code in this editor

global.lives -= 1;
effect_create_above(ef_cloud, x, y, 1, c_red);

if (global.lives > 0) {
	other.x = 150;
	other.y = 350;
	other.sprite_index = spr_player_idle;
} 

audio_play_sound(snd_damage, 1, false);