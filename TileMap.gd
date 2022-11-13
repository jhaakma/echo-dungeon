extends TileMap
class_name EchoTileMap

onready var tile_size = get_cell_size()
const COLLISION_TILE_INDEX = 1
signal mobile_echo(mobile)

func get_grid_position(position):
    return position.snapped(Vector2.ONE * tile_size) / tile_size

func has_collision_at_position(x, y):
    var tile_index = get_cell(x, y)
    return tile_index == COLLISION_TILE_INDEX

# Check to see if the mobile can move in the requested direction
func can_move(position, direction):
    var tile_position = get_grid_position(position)
    var target_position = tile_position + direction
    return !has_collision_at_position(target_position.x, target_position.y)

func move_mobile(mobile, direction):
    if can_move(mobile.position, direction):
        mobile.move_and_collide(direction * tile_size)
        mobile.position = mobile.position.snapped(Vector2.ONE * tile_size)
        emit_signal("mobile_echo", mobile)
        return true
    return false
