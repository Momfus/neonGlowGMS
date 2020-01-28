///@description Information
draw_text(0, 0, "Demo efecto shader Glow.\noriginal by @blokatt y modificado por @momfus\n" +
				"FPS: " + string(fps_real) +
				"\nIntensidad Glow (Q/W): " + string(__shUniform_outerIntensity) +
				"\nIntensidad glow interno (A/S): " + string(__shUniform_innerIntensity) + 
				"\nDisminución del glow interno (X/C): " + string(__shUniform_lengthMultiplier));

