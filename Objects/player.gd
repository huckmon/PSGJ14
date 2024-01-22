extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)
@export var player_health = 100

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

@onready var hurt_sound = $hurt_player

var death_screen = "res://Levels/death_screen.tscn"
var player_dead = false
var input_direction

func _ready():
	update_animation_parameters(starting_direction)
	player()

#function to pass the player method so other characters can use it
func player():
	pass

# change movement later to have initial acceleration
func _physics_process(_delta):
	if !player_dead:
		input_direction = Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			Input.get_action_strength("down") - Input.get_action_strength("up")
		)
		update_animation_parameters(input_direction)
		
		velocity = input_direction.normalized() * move_speed
		move_and_slide()
		pick_new_state()
		
		swarm_damage()
	death_check()

# animation stuff
func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

# swarm collision func
# REMEMBER THAT THE SWARM TILE NEEDED THE COLLISION 2 AND THE PLAYER NEEDED MASK 2
# also that wierd quirk where it just forgets to have a collision mask
var in_swarm = false
var player_damage_cooldown = true
func _on_player_hitbox_body_entered(body):
	if body.has_method("swarm_char") or body.has_method("spikes"):
		in_swarm = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("swarm_char"):
		in_swarm = false

func swarm_damage():
	if in_swarm and player_damage_cooldown:
		hurt_sound.play()
		player_damage_cooldown = false
		player_health = 0
		$damage_cooldown.start()

func death_check():
	if player_health <= 0 and !player_dead:
		player_dead = true
		state_machine.travel("Dead")
		#state_machine.travel("Dead_Idle")
		$death_timer.start()

func _on_damage_cooldown_timeout():
	player_damage_cooldown = true

func _on_death_timer_timeout():
	get_tree().change_scene_to_file(death_screen)
