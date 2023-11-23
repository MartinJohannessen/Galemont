extends AnimationPlayer

# Path to the AnimatedSprite2D node relative to the AnimationPlayer's parent
var animated_sprite_path: = "AnimatedSprite2D"
var swap = AnimationLibrary.new() as AnimationLibrary


func _ready():
	setup_flip_animation()

func setup_flip_animation():
	var animated_sprite = get_parent().get_node(animated_sprite_path) as AnimatedSprite2D
	var original_scale = animated_sprite.scale
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	animation.length = 0.75  # Animation duration
	animation.track_set_path(track_index, animated_sprite_path + ":scale")
	animation.track_insert_key(track_index, 0, original_scale)                      # Time 0
	animation.track_insert_key(track_index, 0.3, Vector2(0, original_scale.y)) # Time 0.3
	animation.track_insert_key(track_index, 0.6, original_scale)   
	swap.add_animation("flip", animation)
	add_animation_library("swap", swap)
