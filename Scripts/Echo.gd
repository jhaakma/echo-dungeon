class_name Echo

# Starts at 0 and increases until 1. Amplitude of each tile is multiplied by this value
var progress: float
# A list of tiles and their current amplitude for this echo
var nodes
var position: Vector2

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


func _init(pos, node_list):
    nodes = node_list
    position = pos
    progress = 0

