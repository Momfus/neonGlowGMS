// Original creado por @blokatt y modificado por @momfus

#extension GL_OES_standard_derivatives : enable // Nota: Permite el uso de dFdx, dFdy y fwidth. Más info aquí: https://developer.mozilla.org/en-US/docs/Web/API/OES_standard_derivatives

#region Definición de constantes

	#define RADIUS 25.0
	#define PI 3.1415926535897932384626433832795
	#define SIGMA (RADIUS / 3.0)
	#define TSQR_SIGMA (2.0 * SIGMA * SIGMA)

#endregion

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Establecer propiedades uniformes
uniform vec3 u_glowProperties;

#region Definición de funciones

	float gauss(float v) { // Nota: El compilador deberia optimizar esto
		return (1.0 / sqrt(TSQR_SIGMA * PI)) * exp(-(v * v) / TSQR_SIGMA);   
	}

	float luma(vec3 c){ // Nota del autor original: No tiene que ser necesariamente intensidad, un smoothstep no sería una mala idea
		return 0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b;
	}

#endregion

void main() {	
    
	vec2 offset = vec2( dFdx(v_vTexcoord.x), 0.0 );   	
	vec4 blur = vec4(0);    

	// Corroborar todo alrededor del pixel de la imagen dentro de unr adio señalado al principio del código
    for (float i = -RADIUS; i <= RADIUS; i += 1.0) {  
		
		// Si esta fuera de la textura de la imagen, no se hacer modificación alguna.
		if ( v_vTexcoord.x < 0.0 || v_vTexcoord.y < 0.0 || v_vTexcoord.x > 1.0 || v_vTexcoord.y > 1.0 ) {
			continue;
		}
		
		vec3 tex = texture2D(gm_BaseTexture, v_vTexcoord + offset * i).rgb;
		vec2 gaussV = vec2(gauss(i), gauss(i * u_glowProperties.b));    	
		
		blur += vec4(vec3(tex.rgb * gaussV.x), luma(tex) * gaussV.y);	
		
    }

    gl_FragColor = vec4( blur.rgb, blur.a );
	
}
