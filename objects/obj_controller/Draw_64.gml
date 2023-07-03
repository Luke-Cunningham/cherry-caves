var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

if (room == Title) {
	draw_set_color(c_red);
	draw_set_font(fnt_score);
	draw_text(cam_w/2, cam_h/2, "PRESS ENTER TO PLAY!");
} else {
	draw_set_color(c_black);
	draw_rectangle(0, 0, cam_w, 40, false);

	draw_set_color(c_white);
	draw_set_font(fnt_score);
	draw_text(20, 10, "SCORE: " + string(score));

	draw_sprite_ext(spr_cherry, -1, (cam_w/2)-32, 10, 0.5, 0.5, 0, c_white, 1);
	draw_text(cam_w/2, 10, string(global.cherries) + "/" + string(global.max_cherries));

	draw_sprite_ext(spr_player_idle, -1, cam_w-110, 30, 0.5, 0.5, 0, c_white, 1);
	draw_text(cam_w-200, 30, " X " + string(global.lives));
}