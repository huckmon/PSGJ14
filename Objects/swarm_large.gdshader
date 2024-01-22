shader_type canvas_item;

uniform sampler2D noise_img : repeat_enable;
uniform vec2 scroll = vec2(0.05, 0.05);

void fragment() {
	COLOR.rgb = texture(noise_img, UV).rbg;
	COLOR.a = texture( TEXTURE, UV).a;
	vec4 noise_col = texture(noise_img, UV + scroll * TIME);
	COLOR = noise_col;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
