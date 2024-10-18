extends State

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State
@export var run_state: State

func process_frame(delta: float) -> State:
	if !parent.is_on_floor():
		return fall_state
	return null

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("sprint"):
		return run_state
	elif Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		parent.velocity.x = move_toward(parent.velocity.x, walk_speed, walk_acc)
		parent.animations.flip_h = false
	elif Input.is_action_pressed("left"):
		parent.velocity.x = move_toward(parent.velocity.x, -walk_speed, walk_acc)
		parent.animations.flip_h = true
	else:
		if parent.velocity.x == 0: 
			return idle_state
		parent.velocity.x = lerp(parent.velocity.x, 0.0, walk_dec)
		
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Walk"
