extends TileMap

# @onready var tile_map = $Swarm

func get_surrounding_tiles():
	var neighbours = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
	for n in neighbours: 
		print(neighbours + n)

#@onready var tile_map = $swarmTileMap
#var tile_map_layer = 0 
#var tile_map_cell_position = Vector2i(1,1) 
#var tile_data = tile_map.get_cell_tile_data(tile_map_layer, tile_map_cell_position)
#if tile_data: 
	#var tile_map_cell_source_id = tile_map.get_cell_source_id(tile_map_layer, tile_map_cell_position); 
	#var tile_map_cell_atlas_coords = tile_map.get_cell_atlas_coords(tile_map_layer, tile_map_cell_position) 
	#var tile_map_cell_alternative = 0 #tile_map.get_cell_alternative_tile(tile_map_layer, tile_map_cell_position) 
	#var new_tile_map_cell_position = tile_map_cell_position + Vector2i.RIGHT 
	#tile_map.set_cell(tile_map_layer, new_tile_map_cell_position, tile_map_cell_source_id, tile_map_cell_atlas_coords, tile_map_cell_alternative)

#func _input(event):
	#if event.is_action_pressed("mouse_button"):
		#var tile_position = tile_map.local_to_map(tile_map.get_local_mouse_position())
		#var data = tile_map.get_cell_tile_data(0, tile_position)
		#print("set cell")
		#print(data)
		#set_cell(0, tile_position, 0, Vector2i(1, 1))
	


 #func place_test_tile():
#	#71, 40
#	var tile_map_layer = 0 
#	var tile_map_cell_position = Vector2i(0,0) 
#	var tile_data = tile_map.get_cell_tile_data(tile_map_layer, tile_map_cell_position)
#	if tile_data: 
#		var tile_map_cell_source_id = tile_map.get_cell_source_id(tile_map_layer, tile_map_cell_position); 
#		var tile_map_cell_atlas_coords = tile_map.get_cell_atlas_coords(tile_map_layer, tile_map_cell_position) 
#		var tile_map_cell_alternative = tile_map.get_cell_alternative_tile(tile_map_layer, tile_map_cell_position)
#		var new_tile_map_cell_position = tile_map_cell_position + Vector2i.RIGHT 
#		tile_map.set_cell(tile_map_layer, new_tile_map_cell_position, tile_map_cell_source_id, tile_map_cell_atlas_coords, tile_map_cell_alternative)
#	print("does itrun")
