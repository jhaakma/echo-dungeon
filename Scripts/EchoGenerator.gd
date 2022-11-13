class_name EchoGenerator
"""

    Creates an "Echo", a representation of sound waves emanating from a mobile.

    2/3 gives a good enough approximation of the distance to the corner tiles while
    letting us use simple itegers.

    With pythagoras, an adjacent distance of 2 would give an angular distance
    of sqrt(2*2 + 2*2) = 2.828

    If more accurate angles needed, use 5 and 7 (compared to 5/7.07 using pythag)

    With the current implementation, distance is used as an array key, so these
    must be integers
"""
const MAX_DEPTH = 5000
const ADJACENT_DISTANCE = 10
const ANGULAR_DISTANCE = 14
const ADJACENT_DIRECTIONS = [ Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT ]
const ANGULAR_DIRECTIONS = [
    [Vector2.UP, Vector2.LEFT],
    [Vector2.DOWN, Vector2.LEFT],
    [Vector2.UP, Vector2.RIGHT],
    [Vector2.DOWN, Vector2.RIGHT]
]

static func process_node(node, distance, distance_list, processed_nodes):
    if node == null:
        return
    if node.has_collision:
        return
    if processed_nodes.has(node):
        return
    node.distance = distance
    processed_nodes.append(node)
    if !distance_list.has(distance):
        distance_list[distance] = []
    distance_list[distance].append(node)

"""
    Generates an echo from a starting position and a grid
"""
static func create_echo(grid, position: Vector2, amplitude):
    var current_depth = 0
    var distance_list = {} #index is distance, key is list of nodes at that distance
    var processed_nodes = []

    process_node(grid.get_atv(position), 0, distance_list, processed_nodes)
    while current_depth < MAX_DEPTH:
        if distance_list.has(current_depth):
            for node in distance_list[current_depth]:
                for direction in ADJACENT_DIRECTIONS:
                    var new_pos = node.position + direction
                    var new_dist = current_depth + ADJACENT_DISTANCE
                    var adjacent_node = grid.get_atv(new_pos)
                    process_node(adjacent_node, new_dist, distance_list, processed_nodes)
                for directions in ANGULAR_DIRECTIONS:
                    #Check walls on either side, if only one is free, distance is increased
                    var strength = ANGULAR_DISTANCE
                    for direction in directions:
                        var blocking_node = grid.get_atv(node.position + direction)
                        if blocking_node != null and blocking_node.has_collision:
                            strength += ANGULAR_DISTANCE / 2.0

                    if strength <= ANGULAR_DISTANCE:
                        var new_pos = node.position + directions[0] + directions[1]
                        var new_dist = current_depth + strength
                        var adjacent_node = grid.get_atv(new_pos)
                        process_node(adjacent_node, new_dist, distance_list, processed_nodes)

        current_depth += 1
    var nodes = []
    for distance in distance_list:
        for node in distance_list[distance]:
            var tile = {
                x = node.position.x,
                y = node.position.y,
                amplitude = max(0, amplitude - distance/ADJACENT_DISTANCE * 2),
            }
            nodes.append(tile)
    var echo = Echo.new(position, nodes)
    return echo
