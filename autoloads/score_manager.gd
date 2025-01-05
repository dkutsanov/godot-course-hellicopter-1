extends Node

const SCORE_PATH = "user://hellicopter.tap"

var _score: int = 0
var _highscore: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_highscore()
	
func save_higscore():
	var file = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(_highscore)
		file.close()
	else:
		print("failed to save to the file")

func load_highscore() -> void:
	var file = FileAccess.open(SCORE_PATH, FileAccess.READ)
	if file:
		var highscore = file.get_32()
		if highscore != null:
			_highscore = highscore
		file.close()
	else:
		print("failed to load the file")
	

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _highscore

func set_score(v: int) -> void:
	_score = v
	if _score > _highscore:
		_highscore = _score
	
	if _score != 0 and _score % 10 == 0:
		GameManager.increase_speed()
	
	SignalManager.on_score_updated.emit()

func reset_score() -> void:
	set_score(0)

func increment_score() -> void:
	set_score(_score + 1)
