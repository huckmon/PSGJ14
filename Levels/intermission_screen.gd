extends Control

@onready var score = $score

var cooldown_over = false

func _ready():
	score.text = str(global_script.score) + "f"
	$intermission_timer.start()

func _unhandled_key_input(event):
	if event.is_pressed() and cooldown_over:
		global_script.update_level()
		get_tree().change_scene_to_file(global_script.next_floor)

func _on_intermission_timer_timeout():
	cooldown_over = true
