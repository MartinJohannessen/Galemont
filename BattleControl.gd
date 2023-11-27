extends Control

var monster_side_up
var selected_marker_name = ""

func _ready():
	monster_side_up = true

func _process(delta):
		# Selection Logic
	if Input.is_action_just_pressed("west"): # Assuming 'a' is mapped to 'ui_left'
		if monster_side_up:
			selected_marker_name = "FriendlyWest"
	elif Input.is_action_just_pressed("south"): # Assuming 's' is mapped to 'ui_down'
		if monster_side_up:
			selected_marker_name = "FriendlySouth"
	elif Input.is_action_just_pressed("east"): # Assuming 'd' is mapped to 'ui_right'
		if monster_side_up:
			selected_marker_name = "FriendlyEast"
	elif Input.is_action_just_pressed("north"): # Assuming 'd' is mapped to 'ui_right'
		if monster_side_up:
			selected_marker_name = ""
		
	
	# Highlight selection
	if selected_marker_name != "":
		var monster1 = get_parent().get_node("FriendlySide/MonsterContainer").get_node("FriendlyNorth").get_child(0)
		var monster2 = get_parent().get_node("FriendlySide/MonsterContainer").get_node(selected_marker_name).get_child(0)
		monster1.flip_sprite()
		monster2.flip_sprite()
	
	# Swap monster Logic
	if selected_marker_name != "" and Input.is_action_just_pressed("confirm"): # Assuming 'space' is mapped to 'ui_accept'
		get_parent().get_node("FriendlySide/MonsterContainer").swap_monsters(selected_marker_name, "FriendlyNorth")
		selected_marker_name = "" # Reset selection after swap
	
	# Flip friendly side logic
	elif selected_marker_name == "" and Input.is_action_just_pressed("confirm"): # Assuming 'space' is mapped to 'ui_accept'
		get_parent().get_node("FriendlySide").flip_side()
		monster_side_up = not monster_side_up


