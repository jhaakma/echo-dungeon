"""
Mob class

This base class for movement based functionality shared by enemies, player etc

"""
class_name Mob extends Node
var anim = preload("res://Echo/Echo.tscn")


signal generate_echo(position, amplitude)

export var walk_speed = 10
export var run_speed = 10
export var walk_volume = 5
export var run_volume = 30
export var shout_volume = 20

var state
var tileMap: EchoTileMap

func init(newTileMap):
    self.tileMap = newTileMap
    return self

func do_echo(volume):
    var anim_node = anim.instance()
    get_parent().add_child(anim_node)
    anim_node.get_node("AnimatedSprite").set("frame", 1)
    anim_node.tileMap_position = get_parent().position
    anim_node.position = self.position + Vector2(8, 8)
    
    var anim_scale = volume / 20.0
    anim_node.scale = Vector2(anim_scale, anim_scale)
    emit_signal("generate_echo", self.position, volume)

func take_step(direction):
    tileMap.move_mobile(self, direction)
    do_echo(walk_volume)

func shout():
    do_echo(shout_volume)
