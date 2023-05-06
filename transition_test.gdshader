shader_type canvas_item;

uniform vec4 old_color;
uniform vec4 new_color;

uniform float progress;

float anim_func(float t){
	return t * t * (3.0f - 2.0f * t);
}

void fragment() {
	float r = length(UV.xy - vec2(0.5));
	r = anim_func(r);
	if (r < progress){
		COLOR = new_color*texture(TEXTURE, UV);
	} else {
		COLOR = old_color*texture(TEXTURE, UV);
	}

}
