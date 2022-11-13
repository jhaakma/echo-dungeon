class_name EchoShader extends Node

var image = Image.new()
var imageTexture = ImageTexture.new()
var material

func _init(new_material):
    material = new_material
    material.set_shader_param("grid_size", Vector2(48, 27))

func update_image(memory: Memory, grid: Grid):
    image.create(1, 1, false, Image.FORMAT_RGBA8)
    image.lock()
    image.set_pixel(0, 0, Color(1, 1, 1, 1))
    image.unlock()
    image.resize(memory.width, memory.height, Image.INTERPOLATE_NEAREST)
    for x in range(memory.matrix.size()):
        for y in range(memory.matrix[x].size()):
            image.lock()
            var color = Color(memory.matrix[x][y], 0, 0, 1)
            image.set_pixel(x, y, color)

    for x in range(grid.width):
        for y in range(grid.height):
            var grid_node = grid.grid[x][y]
            if grid_node.has_collision:
                var col = image.get_pixel(grid_node.position.x, grid_node.position.y)
                col.g = 1;
                image.set_pixel(grid_node.position.x, grid_node.position.y, col)

    image.unlock()
    imageTexture.create_from_image(image, 1)
    imageTexture.set_data(image)


func update_shader(memory: Memory, grid: Grid):
    update_image(memory, grid)
    material.set_shader_param("amplitude_map", imageTexture)
