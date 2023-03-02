shader_type canvas_item;
uniform float alpha : hint_range( 0.0, 1.0) = 0.0;
uniform vec4 color1 :hint_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 color2 :hint_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
	float index_x = UV.x * 10.0;
	float mod_index_x = mod(index_x, 2.0);
	float index_y = UV.y * 10.0;
	float mod_index_y = mod(index_y, 2.0);
	if(mod_index_y >0.0 && mod_index_y < 1.0){
		if(mod_index_x > 0.0 && mod_index_x < 1.0){
			if((mod_index_x*0.5) > (alpha - 0.5)){
				COLOR = vec4(color1.r, color1.g, color1.b, 1.0);
			}else{
				COLOR.a = 0.0;
			}
		}else{
			if(((mod_index_x-1.0)*0.5) > (alpha)){
				COLOR = vec4(color2.r, color2.g, color2.b, 1.0);
			}else{
				COLOR.a = 0.0;
			}
			
		}
	}else{
		if(mod_index_x > 1.0 && mod_index_x < 2.0){
			if(((mod_index_x-1.0)*0.5) > (alpha-0.5)){
				COLOR = vec4(color1.r, color1.g, color1.b, 1.0);
			}else{
				COLOR.a = 0.0;
			}			
		}else{
			if(((mod_index_x-1.0)*0.5) > (alpha-0.5)){
				COLOR = vec4(color2.r, color2.g, color2.b, 1.0);
			}else{
				COLOR.a = 0.0;
			}
		}
	}
	
	
}