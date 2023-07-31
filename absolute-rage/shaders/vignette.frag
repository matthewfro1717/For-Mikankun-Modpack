#pragma header
    
uniform float strength;
uniform float size;

uniform float red;
uniform float green;
uniform float blue;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 col = flixel_texture2D(bitmap, uv);

    //modified from this
    //https://www.shadertoy.com/view/lsKSWR

    uv *=  1.0 - uv.yx;
    float vig = uv.x*uv.y * strength; 
    vig = pow(vig, size);

    vig = 0.0-vig+1.0;

    vec3 vigCol = vec3(vig,vig,vig);
    vigCol.r *= (red/255);
    vigCol.g *= (green/255);
    vigCol.b *= (blue/255);
    col.rgb += vigCol;
    col.a += vig;

    gl_FragColor = col;
}