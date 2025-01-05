extends Node2D

class_name Pipes

@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta


func _on__screen_exited() -> void:
	queue_free()

func on_plane_died() -> void:
	set_process(false)
	


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Flappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_PLANE):
	#	body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Flappy:
		ScoreManager.increment_score()
		score_sound.play()
