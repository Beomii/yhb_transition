shader_type canvas_item;
uniform float effect : hint_range( 0.0, 1.0) = 0.0;

void fragment() {
	vec4 color = texture( TEXTURE, UV );
	if(UV.x < (1.0-effect)){
		COLOR.a = 1.0;
	}else{
		COLOR.a = 0.0;
	}
	
}