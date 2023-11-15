extends Node2D

# Assuming these are paths to your monster scenes
var monster_types = []#["res://MonsterTypes/mister_mister.tscn", "res://MonsterTypes/necrocloak.tscn", "res://MonsterTypes/roc.tscn"]


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
	for marker in get_node("MonsterMarkers").get_children():
		var monster_scene = load(random_monster_path())
		var monster_instance = monster_scene.instantiate()
		monster_instance.position = marker.position
		get_node("MonsterContainer").add_child(monster_instance)


