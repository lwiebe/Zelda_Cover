extends Area3D

var direction: Vector2
const speed = 5.0

func _process(delta: float) -> void:
	position += Vector3(direction.x,0,direction.y) * speed * delta
