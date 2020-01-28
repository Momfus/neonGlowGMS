///@description Iniciar atributos

// Código original creado por @blokatt (Glow shader demo) -  06/06/19
// Modificaciones y traducciones realizadas por @momfus (26/01/2020)

__surfaceBase = surface_create(surface_get_width(application_surface), surface_get_height(application_surface)); // surface base para lo que se desea 
__surfaceFinalGlow = surface_create(surface_get_width(application_surface), surface_get_height(application_surface)); // surface final usado donde se aplica el efecto glow sobre el base

// Atributos inciiales que se pasan al shader
__shUniform_outerIntensity = 3.2;
__shUniform_innerIntensity = 20.0
__shUniform_lengthMultiplier = 2.15;


// Hacer random real
randomize();