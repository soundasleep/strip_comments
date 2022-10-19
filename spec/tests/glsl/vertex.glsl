#version 150
// https://libgdx.info/shaders/
// "The Vertex Shader in this case is a simple pass through."

attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_projTrans;

varying vec4 v_color;
varying vec2 v_texCoords;


void main(/* something might be in here */) {
    v_color = a_color;
    v_texCoords = a_texCoord0;
    gl_Position = u_projTrans * a_position;
    /* and
    a long
    comment */
}