extends State

@export var walk_state: State
@export var slide_state: State

func enter() -> void:
	super()
	if parent.animations.flip_h == false:
		parent.velocity.x = dive_speed
	elif parent.animations.flip_h == true:
		parent.velocity.x = -dive_speed

func process_frame(delta: float) -> State:
	if parent.is_on_floor():
		return slide_state if parent.velocity.x != 0 else walk_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta * 0.75
	parent.move_and_slide()
	
	return null

func get_state() -> String:
	return "Dive"
