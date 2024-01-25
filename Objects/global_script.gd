extends Node

#global script to keep track of scores and to move between scenes more effectively

# score cound
var score = 0
# floor count
var current_floor = 1
# next level path
var next_floor
#var fullscreen = false
#var master_bus = AudioServer.get_bus_index("Master")
#var audio_value = 0

func floor_passed():
	score = score + 1
	current_floor = current_floor + 1

func update_level():
	if current_floor == 2:
		next_floor = "res://Levels/game_level_2.tscn"
	elif current_floor == 3:
		next_floor = "res://Levels/game_level_3.tscn"
	elif current_floor == 4:
		next_floor = "res://Levels/game_level_4.tscn"
	elif current_floor == 5:
		next_floor = "res://Levels/game_level_5.tscn"
	elif current_floor == 6:
		next_floor = "res://Levels/game_level_6.tscn"
	elif current_floor == 7:
		next_floor = "res://Levels/game_level_7.tscn"
	elif current_floor == 8:
		next_floor = "res://Levels/final_screen.tscn"
	#else:
		#next_floor = "procedural floor"

#func _physics_process(delta):
	#if fullscreen:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#set_volume()

#func set_volume():
	#AudioServer.set_bus_volume_db(master_bus, audio_value)
	#if audio_value == -30:
		#udioServer.set_bus_mute(master_bus, true)
	#else:
		#AudioServer.set_bus_mute(master_bus, false)

func floor_reset():
	score = 0
	current_floor = 1
