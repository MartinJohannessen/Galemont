extends Node2D  # or KinematicBody2D, RigidBody2D, etc., based on your needs

# Exported variables that can be set in the editor for each monster type
@export var health: int = 10
@export var damage: int = 2

func _ready():
	play_animation_if_possible()

func play_animation_if_possible():
	var animated_sprite = $AnimatedSprite2D
	if is_instance_valid(animated_sprite):
		animated_sprite.play()
		

func flip_sprite():
	var animation_player = $AnimationPlayer
	animation_player.play("swap/flip")

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()

func die():
	# Common death behavior
	queue_free()

# Additional common methods like movement, attack, etc.
