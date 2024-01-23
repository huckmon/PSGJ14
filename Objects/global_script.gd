extends Node

#global script to keep track of scores and to move between scenes more effectively

# score cound
var score = 0
# floor count
var current_floor = 1
# next level path
var next_floor

func floor_passed():
	score = score + 1
	current_floor = current_floor + 1

func update_level():
	if current_floor == 2:
		next_floor = "res://Levels/game_level_2.tscn"
	elif current_floor == 3:
		next_floor = "floor3"
	elif current_floor == 4:
		next_floor = "floor4"
	#else:
		next_floor = "procedural floor"

func floor_reset():
	score = 0
	current_floor = 0

#func _ready():
	#print(score_count)

# swarm spawn

