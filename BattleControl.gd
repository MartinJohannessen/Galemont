extends Control

var selected_marker_name = ""

func _ready():
	pass# Initialize monsters array with CPUParticles2D nodes
	# ...

func _process(delta):
		# Selection Logic
	if Input.is_action_just_pressed("west"): # Assuming 'a' is mapped to 'ui_left'
		selected_marker_name = "FriendlyWest"
	elif Input.is_action_just_pressed("south"): # Assuming 's' is mapped to 'ui_down'
		selected_marker_name = "FriendlySouth"
	elif Input.is_action_just_pressed("east"): # Assuming 'd' is mapped to 'ui_right'
		selected_marker_name = "FriendlyEast"
	elif Input.is_action_just_pressed("north"): # Assuming 'd' is mapped to 'ui_right'
		selected_marker_name = ""
		
	
	# Highlight selection
	if selected_marker_name != "":
		var monster1 = get_parent().get_node("MonsterContainer").get_node("FriendlyNorth").get_child(0)
		var monster2 = get_parent().get_node("MonsterContainer").get_node(selected_marker_name).get_child(0)
		monster1.flip_sprite()
		monster2.flip_sprite()
	
	# Swap Logic
	if selected_marker_name != "" and Input.is_action_just_pressed("confirm"): # Assuming 'space' is mapped to 'ui_accept'
		get_parent().get_node("MonsterContainer").swap_monsters(selected_marker_name, "FriendlyNorth")
		selected_marker_name = "" # Reset selection after swap

