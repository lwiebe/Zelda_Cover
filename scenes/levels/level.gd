extends Node3D

var fireball_scene: PackedScene = preload("res://scenes/vfx/fireball.tscn")

func _on_player_cast_spell(type: String, pos: Vector3, direction: Vector2, size: float) -> void:
	var fireball = fireball_scene.instantiate()
	$Projectiles.add_child(fireball)
	fireball.global_position = pos
	fireball.direction = direction
