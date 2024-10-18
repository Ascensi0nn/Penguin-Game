extends State

@export var walk_state: State

func enter() -> void:
	super()
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var parent_pos: Vector2 = parent.position
	
#	Dive towards mouse position

func process_input(event: InputEvent):
	if parent.is_on_floor():
		return walk_state

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta * 0.75
	
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Dive"
