extends State

@export var idle_state: State
@export var walk_state: State

func process_frame(delta: float) -> State:
	if parent.velocity.x == 0:
		return walk_state
	return walk_state
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	return null

func get_state() -> String:
	return "Slide"
