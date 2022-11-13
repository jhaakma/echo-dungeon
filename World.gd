extends Node2D

const Player = preload("res://Player//Player.tscn")
const Exit =  preload("res://Exit//ExitDoor.tscn")

onready var tileMap = $TileMap

var echoController

export var grid_width = 48
export var grid_height = 27
export var echo_speed = 2
export var echo_decay = 1
export var max_distance = 120

var grid
var borders = Rect2(1, 1, grid_width -2, grid_height -2)
var player
var memory_fade_rate = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()
    # Initialise the grid
    grid = Grid.new(grid_width, grid_height)
    var memory = Memory.new(grid_width, grid_height, memory_fade_rate)
    var echoShader = EchoShader.new(tileMap.material)
    echoController = EchoController.new(memory, grid, echoShader)
    print("Created echoController")
    add_child(echoController)
    player = create_mobile(Player)
    var exit = Exit.instance()
    exit.connect("leaving_level", self, "reload_level")
    add_child(exit)
    LevelService.generate_level(tileMap, borders, grid_width, grid_height, player, exit)
    grid.intialise_grid_from_tiles(tileMap)
    $DebugTexture.texture = echoShader.imageTexture


# Instance a new mobile and add to the map
func create_mobile(mob_class, position = Vector2.ZERO):
    var mob = mob_class.instance().init(tileMap)
    add_child(mob)
    mob.connect("generate_echo", echoController, "_on_echo_generated")
    mob.position = position
    return mob



func reload_level():
    var _did_reload = get_tree().reload_current_scene()
