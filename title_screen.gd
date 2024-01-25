extends Control

var starting_intermission = "res://Levels/starting_intermission_screen.tscn"
var master_bus = AudioServer.get_bus_index("Master")

func _on_start_button_pressed():
	get_tree().change_scene_to_file(starting_intermission)

func _on_quit_button_pressed():
	get_tree().quit()



func _on_fullscreen_check_toggled(toggled_on):
	#if toggled_on == true:
		#global_script.fullscreen = true
	#elif toggled_on == false:
		#global_script.fullscreen = false
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_audio_slider_value_changed(value):
	#value = global_script.audio_value
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
