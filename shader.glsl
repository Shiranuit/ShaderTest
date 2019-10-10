uniform vec2 size;
uniform float time;


#define speed 2.0
#define freq 1.0
#define amp 0.1
#define phase 5.0


vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 p = ( screen_coords.xy / size.xy ) - 0.2;
	
	float sx = (amp)*0.8 * sin( 10.0 * (freq) * (p.x-phase) - 5. * (speed)*time);
	
	float dy = 4./ ( 30. * abs(3.9*p.y - sx - 1.2));
	
	dy += 1./ (60. * length(p - vec2(p.x, 0.)));
	
	return vec4( (p.x + 0.4) * dy, 0.3 * dy, dy, 3.0 );

}