shader_type canvas_item;
uniform float radius : hint_range( 0.0, 1.0) = 0.0;
uniform float screen_width = 1024.0;
uniform float screen_height = 600.0;

void fragment() {
	vec4 color = texture( TEXTURE, UV );
	float screen_ratio = screen_width / screen_height;
	float d = distance( vec2(mix(0.5, UV.x,screen_ratio),UV.y), vec2( 0.5, 0.5 ) );
	
	if(d > radius){
		COLOR.a = 1.0;
	}else{
		COLOR.a = 0.0;
	}
	
}