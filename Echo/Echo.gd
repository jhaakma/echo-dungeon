extends Node2D

var tileMap_position = Vector2.ZERO

func _on_AnimatedSprite_animation_finished():
    queue_free()
 
func _process(_delta):
    material.set_shader_param("tileMap_position", tileMap_position)
