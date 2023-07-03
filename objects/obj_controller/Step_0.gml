/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_enter) and room == Title) {
	room_goto_next();
}

if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

if (global.lives <= 0) {
	instance_destroy(obj_player);
	room_goto(Game_Over);
}

if (room == Room2 and !instance_exists(obj_cherry)) {
	room_goto(Win);
}