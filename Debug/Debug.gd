extends Control

export var volume = 20
export var show_numbers = false
export var show_colors = false

func _physics_process(_delta):
    update()

onready var default_font = get_font("font")

var grid
var distance_nodes

func draw_by_nodes():
    if distance_nodes == null: return
    for node in distance_nodes:
        var position = node.position
        var this_volume = max(0, volume - node.distance)
        var col =  float(this_volume) / volume
        if this_volume > 0:
            if show_numbers:
                var offset = Vector2(0, 14)
                draw_string(
                    default_font,
                    position*16 + offset,
                    str(this_volume),
                    Color(1, 1, 1, col)
                )
            if show_colors:
                draw_rect(
                    Rect2(position*16, Vector2(16, 16)),
                    Color(0.8, 0.9, 1, col),
                    true
                )

func _draw():
    draw_by_nodes()
    if false:
        for x in range(0, 100):
            for y in range(0, 100):
                draw_string(
                    default_font,
                    Vector2(x, y)*16 + Vector2(0,7),
                    str(x),
                    Color.white
                )
                draw_string(
                    default_font,
                    Vector2(x, y)*16 + Vector2(0,14),
                    str(y),
                    Color.white
                )
