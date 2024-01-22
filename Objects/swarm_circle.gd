extends CharacterBody2D

func swarm_char():
	pass

var tile_size = 8
var current_pos = [0, 0]

var spawn_cooldown = true
var spawning_allowed = true
var spawn_count = 0

var move_speed : float = 10

#@onready var spawn_area = $spawn_radius/CollisionShape2D.shape.extents
#@onready var origin = $spawn_radius/CollisionShape2D.global_position
var spawn_offset = 18
#square needs to contain the
var rand_spawn_pos = [0, 0]

func _physics_process(_delta):
	current_pos = [global_position.x, global_position.y]
	velocity = Vector2(1, 0) * move_speed
	move_and_slide()

func _ready():
	$spawn_timer.start()

func _on_spawn_timer_timeout():
	if spawning_allowed:
		spawn_swarm()

func spawn_swarm():
	#var current_pos = [global_position.x, global_position.y]
	if spawn_count < 4:
			spawn_count = spawn_count + 1
			var swarm_scene = (load("res://Objects/swarm_circle.tscn") as PackedScene).instantiate() #points to swarm 
			var swarm = swarm_scene #reference to swarm_scene
			rand_spawn_pos[0] = randi_range(-spawn_offset, spawn_offset)
			rand_spawn_pos[1] = randi_range(-spawn_offset, spawn_offset)
			get_parent().add_child(swarm)
			swarm.global_position = Vector2((current_pos[0] + rand_spawn_pos[0]),(current_pos[1] + rand_spawn_pos[1]))
	#spawning_allowed = false
	$spawn_timer.start()

func _on_enemy_hitbox_body_entered(body):
	if body.is_in_group("wall"):
		spawn_count = 4
