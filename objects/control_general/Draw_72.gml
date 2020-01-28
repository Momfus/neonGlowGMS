///@description Corroborar existencia de surface

if (!surface_exists(__surfaceBase)) {
	__surfaceBase = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
}

if (!surface_exists(__surfaceFinalGlow)) {
	__surfaceFinalGlow = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
}
