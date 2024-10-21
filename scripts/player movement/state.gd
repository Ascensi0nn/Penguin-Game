class_name State
extends Node

@export var animation_name: String
# Speeds
@export var walk_speed = 100.0
@export var run_speed = 175.0
@export var jump_speed = 300.0
@export var dive_speed = 300.0

# Accelerations
@export var walk_acc = 10.0
@export var run_acc = 10.0
@export var walk_dec = 0.2
@export var run_dec = 0.2
@export var slide_dec = 0.1


var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

## Hold a reference to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
	
func flip_right(node: Node2D) -> void:
	node.scale.y = 1
	node.rotation_degrees = 0
	
func flip_left(node: Node2D) -> void:
	node.scale.y = -1
	node.rotation_degrees = 180
	
func facing_right(node: Node2D) -> bool:
	return node.scale.y == 1 and node.rotation_degrees == 0
	
func facing_left(node: Node2D) -> bool:
	return node.scale.y == -1 and abs(node.rotation_degrees) == 180
