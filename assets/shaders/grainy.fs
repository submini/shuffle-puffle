#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define PRECISION highp
#else
    #define PRECISION mediump
#endif

// !! CHANGE THIS to your shader name
// YOU MUST USE THIS VARIABLE IN vec4 effect AT LEAST ONCE
extern PRECISION vec2 grainy;

extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

// [Required] 
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

// Random noise function
number random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    // HEAVY film grain noise - changes over time
    number grain_time = floor(time * 30.0); // Flickering grain
    number grain = random(uv + grain_time * 0.1);
    
    // Multiple layers of HEAVY noise
    number grain2 = random(uv * 2.0 + grain_time * 0.2);
    number grain3 = random(uv * 4.0 + grain_time * 0.15);
    number grain4 = random(uv * 8.0 + grain_time * 0.25);
    number grain5 = random(uv * 16.0 + grain_time * 0.3);
    
    // Combine grain layers with HEAVY weight
    number combined_grain = (grain + grain2 * 0.8 + grain3 * 0.6 + grain4 * 0.4 + grain5 * 0.3) / 3.1;
    
    // Heavy static noise overlay
    number static_noise = random(uv * 15.0 + grainy.r);
    number static_noise2 = random(uv * 25.0 - grainy.y);
    
    // Apply HEAVY grain to all channels
    tex.r += (combined_grain - 0.5) * 0.35;
    tex.g += (combined_grain - 0.5) * 0.35;
    tex.b += (combined_grain - 0.5) * 0.35;
    
    // Add more flickering static
    tex.rgb += vec3((static_noise - 0.5) * 0.2);
    tex.rgb += vec3((static_noise2 - 0.5) * 0.15);
    
    // Extra large grain particles
    number large_grain = random(uv * 0.5 + grain_time * 0.05);
    tex.rgb += vec3((large_grain - 0.5) * 0.25);
    
    // Desaturation for old film look
    number avg = (tex.r + tex.g + tex.b) / 3.0;
    tex.r = mix(avg, tex.r, 0.75);
    tex.g = mix(avg, tex.g, 0.75);
    tex.b = mix(avg, tex.b, 0.75);
    
    // Reduce brightness
    tex.rgb = tex.rgb * 0.92;
    
    // Heavy scan lines
    number scanline = sin(uv.y * 200.0 + time * 5.0);
    tex.rgb += vec3(scanline * 0.05);
    
    // Add visible noise clusters
    number cluster = random(floor(uv * 20.0) + grain_time);
    tex.rgb += vec3((cluster - 0.5) * 0.12);

    return dissolve_mask(tex*colour, texture_coords, uv);
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif