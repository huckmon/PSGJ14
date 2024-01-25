extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# dash speed
var speed = 10
# is the player visable?
var player_visable = false
# is the monster dashing?
var dashing = false
# is the dash on cooldown?
var dash_cooldown = false
var can_dash = false
var wait_for_timer = false
var dash_sfx = false
var player
var enemy_pos
var player_pos

func _ready():
	enemy()
	state_machine.travel("dormant")

func enemy():
	pass

func _physics_process(delta):
	if player_visable and !dashing and !dash_cooldown and !wait_for_timer:
		#print("player detection")
		state_machine.travel("detection")
		can_dash = true
		wait_for_timer = true
		$detection_timer.start()
	elif dashing and !dash_cooldown and can_dash:
		#print("dashing")
		dash()
	#print(dashing, " ", dash_cooldown, " ", can_dash)
	#elif !dashing and dash_cooldown:
		#print("cooldown")
		#$dash_cooldown.start()

func dash():
	state_machine.travel("dormant")
	if round(position) != round(player_pos) and !dash_sfx:
		position += (player_pos - position)/speed
		dash_sfx = true
		$dash_sfx.play()
	elif round(position) != round(player_pos) and dash_sfx:
		position += (player_pos - position)/speed
	elif round(position) == round(player_pos):
		dash_cooldown = false
		dashing = false
		can_dash = false
		dash_sfx = false
		#print(dashing, dash_cooldown, " func")

func _on_detection_hitbox_body_entered(body):
	if body.has_method("player"):
		#print("yes player")
		player = body
		player_visable = true

func _on_detection_hitbox_body_exited(body):
	if body.has_method("player"):
		#print("no player")
		player_visable = false

func _on_detection_timer_timeout():
	if !dashing and !dash_cooldown and can_dash:
		dashing = true
		player_pos = player.global_position
		wait_for_timer = false

func _on_dash_cooldown_timeout():
	dash_cooldown = false
