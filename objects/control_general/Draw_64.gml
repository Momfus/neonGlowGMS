///@description Information
draw_text(0, 0, "Demo efecto shader Glow.\noriginal by @blokatt y modificado por @momfus\n" +
				"FPS: " + string(fps_real) +
				"\nIntensidad Glow externo (Q/W): " + string(__shUniform_outerIntensity) +
				"\nIntensidad Glow interno (A/S): " + string(__shUniform_innerIntensity) + 
				"\nMultiplicador GLOW (X/C): " + string(__shUniform_lengthMultiplier));

