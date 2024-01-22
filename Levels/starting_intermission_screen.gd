extends Control

var cooldown_over = false

var game_level = "res://Levels/game_level.tscn"

func _ready():
	$intermission_timer.start()

func _unhandled_key_input(event):
	if event.is_pressed() and cooldown_over:
		get_tree().change_scene_to_file(game_level)

func _on_intermission_timer_timeout():
	cooldown_over = true

