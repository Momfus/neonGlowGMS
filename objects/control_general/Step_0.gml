///@description Control de parametros del glow

__shUniform_outerIntensity = max(0, __shUniform_outerIntensity + (keyboard_check(ord("W")) - keyboard_check(ord("Q"))) * 0.05);
__shUniform_innerIntensity = max(0, __shUniform_innerIntensity + (keyboard_check(ord("S")) - keyboard_check(ord("A"))) * 0.05);
__shUniform_lengthMultiplier = max(0, __shUniform_lengthMultiplier + (keyboard_check(ord("C")) - keyboard_check(ord("X"))) * 0.05);