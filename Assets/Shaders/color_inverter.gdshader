shader_type canvas_item;
render_mode unshaded, blend_disabled;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform vec4 color_a : source_color;
uniform vec4 color_b : source_color;
uniform float tolerance = 0.05;

void fragment() {
    vec4 screen_col = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0);

    float diff_a = distance(screen_col.rgb, color_a.rgb);
    float diff_b = distance(screen_col.rgb, color_b.rgb);

    if (diff_a < tolerance) {
        COLOR = vec4(color_b.rgb, screen_col.a);
    } else if (diff_b < tolerance) {
        COLOR = vec4(color_a.rgb, screen_col.a);
    } else {
        COLOR = screen_col;
    }
}