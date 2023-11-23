extends Node2D

# Assuming these are paths to your monster scenes
var monster_types = []

func find_monsters(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tscn"):
				var monster_path = path + file_name
				monster_types.append(monster_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func _ready():
	find_monsters("res://MonsterTypes/")
	spawn_monsters()
	

func random_monster_path() -> String:
	return monster_types[randi() % monster_types.size()]

func spawn_monsters():
	for marker in get_children():
		var monster_scene = load(random_monster_path())
		var monster_instance = monster_scene.instantiate()
		marker.add_child(monster_instance)
		

func swap_monsters(marker_name1, marker_name2):
	var marker1 = get_node(marker_name1)
	var marker2 = get_node(marker_name2)

	# Check if both markers have a monster child
	if marker1.get_child_count() == 0 or marker2.get_child_count() == 0:
		print("One of the markers does not have a monster to swap.")
		return

	var monster1 = marker1.get_child(0)
	var monster2 = marker2.get_child(0)

	# Swap the monsters by reassigning their parents
	marker1.remove_child(monster1)
	marker2.remove_child(monster2)
	
	marker1.add_child(monster2)
	marker2.add_child(monster1)
