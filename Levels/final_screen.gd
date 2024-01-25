extends Control
var title_screen = "res://Levels/title_screen.tscn"

func _ready():
	$stairs_sound.play()

func _on_quit_to_menu_pressed():
	get_tree().change_scene_to_file(title_screen)

func _on_quit_pressed():
	get_tree().quit()
