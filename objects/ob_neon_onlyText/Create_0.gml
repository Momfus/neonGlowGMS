/// @description inicio atributos

enum e_textGlow {

	xx,			// 0
	yy,			// 1
	text,		// 2
	xscale,		// 3
	yscale,		// 4
	colorText,	// 5
	colorGlow,	// 6
	angle		// 7
	
}

__arrayTextGlow = array_create(8, noone);

__arrayTextGlow[e_textGlow.xx] = room_width * 0.5;
__arrayTextGlow[e_textGlow.yy] = room_height - 150;
__arrayTextGlow[e_textGlow.text] = "CRIOS DEVS";
__arrayTextGlow[e_textGlow.xscale] = 2;
__arrayTextGlow[e_textGlow.yscale] = 2;
__arrayTextGlow[e_textGlow.colorText] = c_white;
__arrayTextGlow[e_textGlow.colorGlow] = c_orange;
__arrayTextGlow[e_textGlow.angle] = 0;

