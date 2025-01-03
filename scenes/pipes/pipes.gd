extends Node2D

class_name Pipes

const SPEED: float = 120.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SPEED * delta


func _on__screen_exited() -> void:
	queue_free()
