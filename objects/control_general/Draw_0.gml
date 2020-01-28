///@description Horizontal pass

/// Nota --> esto es para los objetos que dibujan glow, que en verdad va debajo y encima esta el dibujado de lo que hacen los objetos normalmente

#region Dibujado de surface base de lo que se aplcia efecto

	surface_set_target(__surfaceBase); 

		draw_clear(c_black);

		// Dibujar todo lo que tenga efecto glow
		with (parent_neonGlow) {
			
			// Se ignora lols que sean textos solamente y no tengan sprite
			if( sprite_index != -1 ) {
				draw_self();
			} else {
				
				// Buscar una manera de centralizar esto para cualquier texto (se podria usar un arreglo para generalizar los atributos)
				draw_set_colour(c_orange);
				draw_set_alpha(image_alpha);
					draw_text_transformed(room_width * 0.5, room_height - 150, "CRIOS DEVS", 2, 2, 0); 
				draw_set_alpha(1);
				
			}
	
		}

	surface_reset_target();


#endregion



#region Realizar efecto Glow horizontal

	surface_set_target(__surfaceFinalGlow);

		draw_clear_alpha(c_black, 0);

		shader_set(sh_blurHorizontal);
	
			shader_set_uniform_f(
				shader_get_uniform(sh_blurHorizontal, "u_glowProperties"),
				__shUniform_outerIntensity,
				__shUniform_innerIntensity, 
				__shUniform_lengthMultiplier
			);

			gpu_set_blendenable(false); // Necesario hacerse
				draw_surface(__surfaceBase, 0, 0);
			gpu_set_blendenable(true);

		shader_reset();

	surface_reset_target();


#endregion

#region Efecto glow vertical y ajustes finales

	gpu_set_blendmode(bm_add);

	shader_set(sh_blurVertical);
			
			shader_set_uniform_f(
				shader_get_uniform(sh_blurVertical, "u_glowProperties"),
				__shUniform_outerIntensity,
				__shUniform_innerIntensity,
				__shUniform_lengthMultiplier
			);
			
			draw_surface(__surfaceFinalGlow, 0, 0);
			
	shader_reset();

	gpu_set_blendmode(bm_normal);

#endregion



// Volver el font como antes
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
