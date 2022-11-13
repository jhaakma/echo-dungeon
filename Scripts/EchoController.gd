
"""

"""
class_name EchoController extends Node

const FADE_RATE = 0.2
const EXPAND_RATE = 2.0

var active_echo_list
var memory
var echoShader
var grid

func _init(new_memory: Memory, new_grid: Grid, new_echoShader: EchoShader):
    grid = new_grid
    memory = new_memory
    echoShader = new_echoShader
    active_echo_list = []

"""
Each frame, fade existing memory then update the shader
"""
func _process(delta):
    memory.fade_memory(FADE_RATE * delta)
    process_echoes(delta)
    echoShader.update_shader(memory, grid)

"""
Generate new echo and add to active_echo_list
"""
func _on_echo_generated(position, amplitude):
    var echo = EchoGenerator.create_echo(grid, position/16.0, amplitude)
    active_echo_list.append(echo)

"""
    - For all echoes that have progress less than 1, increase their progress according to EXPAND_RATE
    - if progress was updated, trigger memory update
    - when progress reaches 1, remove echo from active_echo_list
"""
func process_echoes(delta):
    for echo in active_echo_list:
        if echo.progress < 1:
            if echo.progress > 0.2:
                pass
            for node in echo.nodes:
                var amplitude = node.amplitude * echo.progress
                memory.learn_tile(node.x, node.y, amplitude)
            echo.progress += EXPAND_RATE * delta
        else:
            active_echo_list.erase(echo)



