#version 410 core

layout(location = 0) in vec3 vertex_position;
layout(location = 1) in vec3 vertex_color;
out vec3 colour;
uniform int ok;
void main() {
	if(ok == 0)
		colour = vertex_color;
	else
		colour = vec3(1-vertex_color.x,1-vertex_color.y,1-vertex_color.z);
	gl_Position = vec4(vertex_position, 1.0);
}

