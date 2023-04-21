shader_type spatial;
render_mode cull_back, specular_toon; 


uniform float speed = 2.0; 
uniform float x_amount = 0.1; 
uniform float y_amount = 0.1; 
uniform float z_amount = 0.05; 


void vertex() { 
	vec3 dir = NODE_POSITION_WORLD - VERTEX; 
	float offset = VERTEX.x + VERTEX.z; 
	float rand = fract(dir.z) * sin(offset * 155.0); 
	
	VERTEX.x += sin(((dir.x + TIME) + offset) * speed) * x_amount; 
	VERTEX.z += sin(((dir.z + TIME) + offset) * speed) * y_amount; 
	VERTEX.y += sin(((dir.y + TIME) + offset) * speed) * z_amount; 
	
}