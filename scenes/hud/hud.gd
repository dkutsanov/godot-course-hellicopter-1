extends Control

@onready var score: Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_updated.connect(on_score_updated)
	
func on_score_updated() -> void:
	score.text = str(ScoreManager.get_score())
