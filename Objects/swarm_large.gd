extends CharacterBody2D

func swarm_char():
	pass

var move_speed : float = 30

func _physics_process(_delta):
	velocity = Vector2(1, 0) * move_speed
	move_and_slide()
