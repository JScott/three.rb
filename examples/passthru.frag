#version 400 core

out vec4 fColor;
uniform vec4 uColor;

void main()
{
	fColor = vec4( uColor );
}