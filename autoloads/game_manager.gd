extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://main/main.tscn")

var SCROLL_SPEED: float = 120.0
const GROUP_PLANE: String = "Plane"

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)

func increase_speed() -> void:
	SCROLL_SPEED += 30

func reset_speed() -> void:
	SCROLL_SPEED = 120.0
