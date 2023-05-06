shader_type canvas_item;


void fragment() {
		float coeff = pow(mix(0.2,0.8,abs(0.5 - UV.y)*2.), 3.);
		COLOR.a = 1.-coeff;
}
