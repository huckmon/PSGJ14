extends Area2D

#export(PackedScene) var target_scene

var intermission_screen = "res://Levels/intermission_screen.tscn"
var player_method = "player"

#func _ready():
	#pass

# doesn't need an exit function as there's no way to go back a level
func _on_body_entered(body):
	if body.has_method(player_method): # if the body that enters has the player method, then trigger the scene change
		# probably have to write something that passes something off to a game/world manager script to move to the next scene
		#gamemanager.transition_scene = true
		#print("next level")
		global_script.floor_passed()
		get_tree().change_scene_to_file(intermission_screen)


