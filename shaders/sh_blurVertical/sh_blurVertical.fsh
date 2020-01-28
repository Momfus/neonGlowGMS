// Original creado por @blokatt y modificado por @momfus

#extension GL_OES_standard_derivatives : enable // Nota: Permite el uso de dFdx, dFdy y fwidth. Más info aquí: https://developer.mozilla.org/en-US/docs/Web/API/OES_standard_derivatives

#region Definición de constantes

	#define RADIUS 25.0
	#define PI 3.1415926535897932384626433832795
	#define SIGMA (RADIUS / 3.)
	#define TSQR_SIGMA (2. * SIGMA * SIGMA)

#endregion


varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Establecer propiedades uniformes
uniform vec3 u_glowProperties;

#region Definición de funciones

	float gauss(float v) { // Nota: El compilador deberia optimizar esto
		return (1.0 / sqrt(TSQR_SIGMA * PI)) * exp(-(v * v) / TSQR_SIGMA);   
	}

#endregion

void main() {	
	
    vec4 blur = vec4(0);    
    vec2 offset = vec2(0., dFdy(v_vTexcoord.y));
    	
	// Corroborar todo alrededor del pixel de la imagen dentro de unr adio señalado al principio del código
    for (float i = -RADIUS; i <= RADIUS; i += 1.) {  
		
		// Si esta fuera de la textura de la imagen, no se hacer modificación alguna.
		if (v_vTexcoord.x < 0. || v_vTexcoord.y < 0. || v_vTexcoord.x > 1. || v_vTexcoord.y > 1.) {
			continue;
		}
		
		vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord + offset * i);
		vec2 gaussV = vec2(gauss(i), gauss(i * u_glowProperties.b));
		
    	blur += vec4(vec3(tex.rgb * gaussV.x), tex.a * gaussV.y);	
		
    }	
	
    gl_FragColor = v_vColour * vec4(blur.rgb * u_glowProperties.r + blur.aaa * u_glowProperties.g, 1.0);	
	
}
