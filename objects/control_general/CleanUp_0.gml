///@description Liberar surface de memoria

if (surface_exists(__surfaceBase)) {
	surface_free(__surfaceBase);
}

if (surface_exists(__surfaceFinalGlow)) {
	surface_free(__surfaceFinalGlow);
}
