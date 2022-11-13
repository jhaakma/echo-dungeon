class_name Grid

var grid = []
var width
var height

# Constructs a new 2d Grid initialised with a given width, height and default value
func _init(w: int, h: int, default_value = null):
    width = w
    height = h
    for x in width:
        grid.append([])
        for y in height:
            grid[x].insert(y, default_value)

func intialise_grid_from_tiles(tileMap):
    for x in grid.size():
        for y in grid[x].size():
            var node = GridNode.new(Vector2(x, y))
            add(node, x, y)
            if tileMap.get_cell(x, y) == 1:
                get_at(x, y).has_collision = true

func arr_in_bounds(arr, index):
    var size = arr.size()
    var range_list = range(size)
    return range_list.has(index)

func is_in_bounds(x, y):
    return arr_in_bounds(grid, x) and arr_in_bounds(grid[x], y)

# Adds a value at the given location
func add(value, x, y):
    if !is_in_bounds(x, y):
        return null
    grid[x][y] = value
    return value

func addv(value, pos: Vector2):
    return add(value, int(pos.x), int(pos.y))

# Removes and returns value at given x and y
func remove(x: int, y: int):
    if !is_in_bounds(x, y):
        return null
    var value = get_at(x, y)
    grid[x][y] = null
    return value

# Removes and returns value at given position
func removev(pos: Vector2):
    return remove(int(pos.x), int(pos.y))

# Gets the value from the given x and y
func get_at(x: int, y: int):
    if !is_in_bounds(x, y):
        return null
    return grid[x][y]

# Gets the value from the given vec2 position
func get_atv(pos: Vector2):
    return get_at(int(pos.x), int(pos.y))
