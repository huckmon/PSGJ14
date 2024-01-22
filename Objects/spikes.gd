extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var player_method = "player"
var count = 0
var can_hit = false

func spikes():
	pass

func _ready():
	state_machine.travel("Idle")
	#$spike_hitbox/CollisionShape2D.set_deferred("disabled", true)

func _on_spike_activation_body_entered(body):
	if body.has_method(player_method) and count == 0:
		state_machine.travel("spikes_activated")
		$spike_sound.play()
		count =  1
		#$spike_hitbox/CollisionShape2D.enabled = true
		$Timer.start()

func _on_timer_timeout():
	#$spike_hitbox/CollisionShape2D.set_deferred("disabled", false) 
	if count == 1:
		state_machine.travel("Idle_extended")
		count = 2
		$Timer.start()
	elif count == 2:
		state_machine.travel("spikes_retracting")
		count = 3
		$Timer.start()
	elif count == 3:
		state_machine.travel("Idle")
		count = 0
		#$spike_hitbox/CollisionShape2D.set_deferred("disabled", true) 

#func _on_kill_box_body_entered(body):
	#print("activated")
	#if body.has_method(player_method):
		#state_machine.set("kill")
