extends CharacterBody2D

func get_surrounding_tiles():
	var neighbours = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
	for n in neighbours: 
		print(neighbours)

func swarm_char():
	pass

#movement script to change for placing
# this works to move based on almost a grid like movment
# leave this as is and move to making a spawning algorithim
var currPos = [global_position.x, global_position.y]
#var tile_size = 16
#func _input(event):
	#if event.is_action_pressed("mouse_button"):
		#spawn_swarm()
		#if touching_wall_right != true:
			##return
			#currPos[0] = tile_size
			##print(currPos)
			#self.position = Vector2(global_position) + Vector2(currPos[0], currPos[1])
		##print(global_position)
	#self.position = Vector2(global_position) #+ Vector2(currPos[0], currPos[1])


#spawning section
##@onready var swarm_scene = (load("res://Objects/swarm_enemy.tscn") as PackedScene).instantiate()
var spawn_cooldown = true
var spawning_allowed = true
func spawn_swarm():
	#print("spawn check")
	var currentPos = [global_position.x, global_position.y]
	var count = 0
	if spawn_cooldown:
		for n in wall_check:
			count = count + 1
			var swarm_scene = (load("res://Objects/swarm_enemy.tscn") as PackedScene).instantiate() #points to swarm 
			var swarm = swarm_scene #reference to swarm_scene
			var tile_size = 16
			if (wall_check[n] == 0):
				pass
			elif wall_check[0] == 1 and (count == 1): # check right
				get_parent().add_child(swarm_scene)
				swarm_scene.global_position += Vector2((currentPos[0] + tile_size), currentPos[1])
			elif wall_check[1] == 1 and (count == 2): # check left
				get_parent().add_child(swarm_scene)
				tile_size = -tile_size # declares that spawn offset is negative (left side)
				swarm_scene.global_position += Vector2((currentPos[0] + tile_size), currentPos[1])
			elif wall_check[2] == 1 and (count == 3): # check up
				get_parent().add_child(swarm_scene)
				tile_size = -tile_size # declares that spawn offset is negative (up side)
				swarm_scene.global_position += Vector2((currentPos[0]), currentPos[1] + tile_size)
			elif wall_check[3] == 1 and (count == 4): # check down
				get_parent().add_child(swarm_scene)
				swarm_scene.global_position += Vector2((currentPos[0]), currentPos[1] + tile_size)
	#spawn_cooldown = false
	spawning_allowed = false
	#print("spawn_cooldown")
	#$spawn_timer.start()

func _on_spawn_timer_timeout():
	#print("spawn_timer finish")
	#if wall_check == wall_fail:
		#spawning_allowed = false
	#manual_check_surroundings()
	#spawn_cooldown = true
	if spawning_allowed:
		spawn_swarm()
		#pass

func _ready():
	#print("ready")
	$spawn_timer.start()
	#print("spawn timer start")

# check if touching wall funcs

# might be better to use an array here instead so spawn checks can be looped instad
# array get's changed to one if it's touching a wall on x side 
# array is right, left, up, down
var wall_check = [1, 1, 1, 1]
var wall_fail = [0, 0, 0, 0]

func _on_right_body_entered(body):
	if body.is_in_group("wall"):
		#print("touching wall right")
		wall_check[0] = 0
		#print(wall_check)
	elif body.has_method("swarm_char"):
		#print("touching swarm right")
		wall_check[0] = 0

func _on_left_body_entered(body):
	if body.is_in_group("wall"):
		#print("touching wall left")
		wall_check[1] = 0
		#print(wall_check)
	elif body.has_method("swarm_char"):
		#print("touching swarm left")
		wall_check[1] = 0

func _on_up_body_entered(body):
	if body.is_in_group("wall"):
		#print("touching wall up")
		wall_check[2] = 0
		#print(wall_check)
	elif body.has_method("swarm_char"):
		#print("touching swarm up")
		wall_check[2] = 0

func _on_down_body_entered(body):
	if body.is_in_group("wall"):
		#print("touching wall down")
		wall_check[3] = 0
		#print(wall_check)
	elif body.has_method("swarm_char"):
		#print("touching swarm down")
		wall_check[2] = 0
