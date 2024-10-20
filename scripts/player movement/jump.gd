extends State

@export var fall_state: State
@export var dive_state: State

func enter() -> void:
	super()
	parent.velocity.y = -jump_speed
	
func process_frame(delta: float) -> State:
	if parent.velocity.y > 0.0:
		return fall_state
	return null
	
func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("dive"):
		return dive_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var current_speed = run_speed if Input.is_action_pressed("sprint") else walk_speed
	var current_acc = run_acc if Input.is_action_pressed("sprint") else walk_acc
	
	if Input.is_action_pressed("right"):
		parent.velocity.x = move_toward(parent.velocity.x, current_speed, current_acc)
		flip_right(parent)
	elif Input.is_action_pressed("left"):
		parent.velocity.x = move_toward(parent.velocity.x, -current_speed, current_acc)
		flip_left(parent)
	
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Jump"
