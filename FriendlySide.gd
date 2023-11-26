# FriendlySide.gd (Attached to FriendlySide Node2D)
extends Node2D

var animation_player = null  # Will hold the AnimationPlayer
var friendly_animation_library = AnimationLibrary.new() as AnimationLibrary

func _ready():
	setup_animation_player()

func setup_animation_player():
	animation_player = AnimationPlayer.new()
	add_child(animation_player)
	setup_flip_animation()

func setup_flip_animation():
	var original_scale = scale # Assuming scale manipulation
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	
	animation.length = 0.75  # Animation duration
	animation.track_set_path(track_index, ":scale")
	animation.track_insert_key(track_index, 0, original_scale)                 # Time 0
	animation.track_insert_key(track_index, 0.3, Vector2(original_scale.x, 0)) # Time 0.3
	animation.track_insert_key(track_index, 0.6, original_scale)               # Time 0.6
	
	friendly_animation_library.add_animation("flip_friendly", animation)
	animation_player.add_animation_library("friendly_animation_library", friendly_animation_library)

func flip_side():
	if animation_player != null:
		animation_player.play("friendly_animation_library/flip_friendly")
