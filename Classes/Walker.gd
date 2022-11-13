
class_name Walker

const DIRECTIONS = [Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN]

var position = Vector2.ZERO
var direction = Vector2.RIGHT
var borders = Rect2()
var step_history = []
var steps_since_turn = 0
var rooms = []

const ROOM_CHANCE = 25
const MIN_STEPS_BEFORE_TURN = 5
const MAX_STEPS_BEFORE_TURN = 8
const MIN_ROOM_SIZE = 2
const MAX_ROOM_SIZE = 7

func _init(starting_position, new_borders):
    assert(new_borders.has_point(starting_position))
    position = starting_position
    step_history.append(position)
    borders = new_borders

func roll(chance):
    return randi() % 100 < chance

func walk(steps):
    place_room(position)
    for step in steps:
        if steps_since_turn >= int(rand_range(MIN_STEPS_BEFORE_TURN, MAX_STEPS_BEFORE_TURN)):
            change_direction()
        
        if step():
            step_history.append(position)
        else:
            change_direction()
    return step_history

func step():
    var target_position = position + direction
    if borders.has_point(target_position):
        steps_since_turn += 1
        position = target_position
        return true
    else:
        return false

func change_direction():
    place_room(position)
    steps_since_turn = 0
    var directions = DIRECTIONS.duplicate()
    directions.erase(direction)
    directions.shuffle()
    direction = directions.pop_front()
    while not borders.has_point(position + direction):
        direction = directions.pop_front()

func create_room(pos, size):
    return {position = pos, size = size}

func place_room(pos):
    var size = Vector2(rand_range(MIN_ROOM_SIZE, MAX_ROOM_SIZE), rand_range(MIN_ROOM_SIZE, MAX_ROOM_SIZE))
    if randi() % 100 > ROOM_CHANCE:
        size = Vector2(1, 1)
        
    var top_left_corner = (pos - size/2).ceil()
    rooms.append(create_room(pos, size))
    for y in size.y:
        for x in size.x:
            var new_step = top_left_corner + Vector2(x, y)
            if borders.has_point(new_step):
                step_history.append(new_step)

func get_end_room():
    var end_room = rooms.pop_front()
    var starting_position = step_history.front()
    for room in rooms:
        if starting_position.distance_to(room.position) > starting_position.distance_to(end_room.position):
            end_room = room
    return end_room








