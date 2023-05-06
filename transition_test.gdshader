shader_type canvas_item;

uniform vec4 old_color;
uniform vec4 new_color;

uniform float progress;

void fragment() {
	float r = length(UV.xy - vec2(0.5));
	if (r < progress){
		COLOR = new_color*texture(TEXTURE, UV);
	} else {
		COLOR = old_color*texture(TEXTURE, UV);
	}

}
