extends State

@export var idle_state: State
@export var walk_state: State
@export var dive_state: State
@export var run_state: State

func enter() -> void:
	super()

func process_frame(_delta: float) -> State:
	if parent.is_on_floor():
		if parent.velocity.x != 0:
			return run_state if Input.is_action_pressed("sprint") else walk_state
		return idle_state
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
		parent.velocity.x = min(parent.velocity.x + current_acc, current_speed)
		flip_right(parent)
	elif Input.is_action_pressed("left"):
		parent.velocity.x = max(parent.velocity.x - current_acc, -current_speed)
		flip_left(parent)
		
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Fall"
