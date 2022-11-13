shader_type canvas_item;
uniform sampler2D amplitude_map;
uniform vec2 grid_size;
uniform mat4 global_transform;
varying vec2 world_position;
const float ceiling = 1.0;

void vertex(){
	world_position = (vec4(VERTEX, 0.0, 1.0)).xy;
}

float get_amplitude(vec2 position_as_ratio, vec2 offset) {
    vec2 adjusted_offset = offset / grid_size / 16.0;
	return min(texture(amplitude_map, position_as_ratio + adjusted_offset).r, ceiling) / ceiling;
}

bool get_wall(vec2 position_as_ratio, vec2 offset) {
    vec2 adjusted_offset = offset / grid_size / 16.0;
	return texture(amplitude_map, position_as_ratio + adjusted_offset).g > 0.0;
}

float get_distance_from_tile_center(vec2 position_as_tile_number, vec2 offset) {
	vec2 tile_center = floor(position_as_tile_number+ offset) + 0.5;
	return distance(position_as_tile_number, tile_center);
}

float blur(vec2 position, int blur_size ){
	float base_amplitude = get_amplitude(position, vec2(0.0, 0.0));
	float sum = 0.0;
    int tiles_used = 0;
	for (int i = -blur_size; i <= blur_size; i++) {
		for (int j = -blur_size; j <= blur_size; j++) {
            vec2 offset = vec2(float(i), float(j));
            bool is_wall = get_wall(position, offset);
			float amplitude = get_amplitude(position, offset);
            float dist = float(abs(i) * abs(j)) / float(blur_size * blur_size);
			if ( !is_wall ) {
                tiles_used = tiles_used + 1;
				sum = sum + amplitude;
			}
		}
	}
	return sum / float(tiles_used);
}

void fragment(){
	vec4 original_color = texture(TEXTURE, UV); //read from texture
	vec2 position_as_tile_number = world_position / 16.0;
	vec2 position_as_ratio = world_position / grid_size / 16.0;
    float amplitude = blur(position_as_ratio, 16);
    COLOR = mix(vec4(0, 0, 0, 1), original_color, min(amplitude, 1.0));
}
