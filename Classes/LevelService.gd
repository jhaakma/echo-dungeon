extends Node

class_name LevelService

static func generate_level(tileMap, borders, grid_w, grid_h, player, exit):
    var walker = Walker.new(Vector2(19, 11), borders)
    var map = walker.walk(300)
    player.position = map.front()*16
    
    exit.position = walker.get_end_room().position*16
    #walker.queue_free()
    for x in range(-2, grid_w + 2):
        for y in range(-2, grid_h + 2):
            tileMap.set_cellv(Vector2(x, y), 1)
    for location in map:
        tileMap.set_cellv(location, 0)
    tileMap.update_bitmask_region(borders.position, borders.end)
