#version 400

layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec3 vertexColour;

uniform float offsetX;
uniform float offsetY;
out vec3 colour;

void main() {
 colour = vertexColour;
 gl_Position = vec4(vertexPosition + vec3(offsetX,offsetY,0.0), 1.0);
}