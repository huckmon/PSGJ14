extends Control

var starting_intermission = "res://Levels/starting_intermission_screen.tscn"

func _on_start_button_pressed():
	get_tree().change_scene_to_file(starting_intermission)

func _on_quit_button_pressed():
	get_tree().quit()
