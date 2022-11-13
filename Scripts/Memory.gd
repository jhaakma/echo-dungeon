"""
    Represents the player's current memory of the map
"""
class_name Memory

const MAX_AMPLITUDE = 10
"""
A matrix representing the player's current memory of the map
"""
var matrix

"""
The grid width and height of the map
"""
var width
var height
var fade_rate = 0.1

"""
Construct new Memory
"""
func _init(w, h, new_fade_rate):
    width = w
    height = h
    fade_rate = new_fade_rate
    init_memory_martrix()

"""
Create empty memory matrix
"""
func init_memory_martrix():
    matrix = []
    for x in range(width):
        matrix.append([])
        for _y in range(height):
            matrix[x].append(0.0)

"""
Reduces the memory of every node by a given amount
"""
func fade_memory(fade_amount: float):
    for x in range(width):
        for y in range(height):
            matrix[x][y] = max(0, matrix[x][y] - fade_amount)

"""
Sets the memory level of the tile to the given amount,
 if greater than the current memory of the tile.
"""
func learn_tile(x, y, amount):
    amount = amount / MAX_AMPLITUDE
    var clamped_value = clamp(amount, matrix[x][y], 1.0)
    matrix[x][y] = clamped_value

