# FriendlySide.gd (Attached to FriendlySide Node2D)
extends Node2D

var animation_player = null  # Will hold the AnimationPlayer
var friendly_animation_library = AnimationLibrary.new() as AnimationLibrary

func _ready():
	setup_animation_player()

func setup_animation_player():
	animation_player = AnimationPlayer.new()
	animation_player.add_animation_library("friendly_animation_library", friendly_animation_library)
	animation_player.connect("animation_finished", Callable(self, "_on_AnimationPlayer_animation_finished"))
	add_child(animation_player)
	
	setup_flip_animation_first_half()
	
	setup_flip_animation_second_half()
	
	

func setup_flip_animation_first_half():

	var original_scale = scale
	var animation = Animation.new()
	var scale_track_index = animation.add_track(Animation.TYPE_VALUE)
	
	animation.length = 0.3
	animation.track_set_path(scale_track_index, ":scale")
	animation.track_insert_key(scale_track_index, 0, original_scale)                 # Time 0
	animation.track_insert_key(scale_track_index, 0.3, Vector2(original_scale.x, 0)) # Time 0.3

	friendly_animation_library.add_animation("flip_friendly_first", animation)

	
func setup_flip_animation_second_half():

	var original_scale = scale
	var animation = Animation.new()
	var scale_track_index = animation.add_track(Animation.TYPE_VALUE)
	
	animation.length = 0.3
	animation.track_set_path(scale_track_index, ":scale")
	animation.track_insert_key(scale_track_index, 0.0, Vector2(original_scale.x, 0)) # Time 0.3
	animation.track_insert_key(scale_track_index, 0.3, original_scale)               # Time 0.6

	friendly_animation_library.add_animation("flip_friendly_second", animation)
	
func flip_side():
	if animation_player != null:
		animation_player.play("friendly_animation_library/flip_friendly_first")
		
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "friendly_animation_library/flip_friendly_first":
		$MonsterContainer.visible = not $MonsterContainer.visible
		animation_player.play("friendly_animation_library/flip_friendly_second")
