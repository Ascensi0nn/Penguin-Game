extends State

@export var walk_state: State
@export var slide_state: State
@export var run_state: State

func enter() -> void:
	super()	
	
	if facing_right(parent):
		parent.velocity.x = dive_speed
	elif facing_left(parent):
		parent.velocity.x = -dive_speed

func process_frame(_delta: float) -> State:
	if parent.is_on_floor():
		return run_state if Input.is_action_pressed("sprint") else walk_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta * 0.75
	parent.move_and_slide()
	
	return null

func get_state() -> String:
	return "Dive"
