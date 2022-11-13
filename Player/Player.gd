"""

"""

extends Mob

var inputs = {
    "ui_left": Vector2.LEFT,
    "ui_right": Vector2.RIGHT,
    "ui_up": Vector2.UP,
    "ui_down": Vector2.DOWN
}

func get_input_direction(event):
    for key in inputs.keys():
        if event.is_action_pressed(key):
            return inputs[key]

func pressed_noise_key(event):
    return event.is_action_pressed("make_noise")

func _unhandled_input(event):
    var input_direction = get_input_direction(event)
    if input_direction:
        take_step(input_direction)
    if pressed_noise_key(event):
        shout()

