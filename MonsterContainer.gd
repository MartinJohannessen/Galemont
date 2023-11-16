extends Node2D

func swap_monster_positions(monster1_path: String, monster2_path: String) -> void:
	var monster1 = get_node_or_null(monster1_path)
	var monster2 = get_node_or_null(monster2_path)

	if monster1 and monster2:
		var temp_position = monster1.position
		monster1.position = monster2.position
		monster2.position = temp_position
	else:
		print("One or both monsters could not be found for swapping.")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
