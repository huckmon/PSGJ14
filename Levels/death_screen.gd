extends Control

@onready var score = $score

var game_level = "res://Levels/game_level.tscn"

func _ready():
	score.text = "FINAL FLOOR: " + str(global_script.score) + "f"

func _on_retry_button_pressed():
	global_script.floor_reset()
	get_tree().change_scene_to_file(game_level)

func _on_quit_button_pressed():
	get_tree().quit()
