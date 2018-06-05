var bbox_side;

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

hsp = (key_right - key_left) * 8;
vsp = (key_down - key_up) * 8;

if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(tilemap, bbox_side + hsp,bbox_top) != 0) || (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0) {
	if (hsp > 0) x = x - (x mod 64) + 63 - (bbox_right - x);
	else x = x - (x mod 64) - (bbox_left - x);
	hsp = 0;

}

x += hsp;

if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap, bbox_left,bbox_side + vsp) != 0) || (tilemap_get_at_pixel(tilemap, bbox_right,bbox_side + vsp) != 0) {
	if (vsp > 0) y = y - (y mod 64) + 63 - (bbox_bottom - y);
	else y = y - (y mod 64) - (bbox_top - y);
	vsp = 0;

}

y += vsp;