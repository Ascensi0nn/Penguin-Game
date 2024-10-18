extends Camera2D

const buffer = 50

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var target = event.position - get_viewport().size * 0.5
		if target.length() < buffer:
			self.position = Vector2(0,0)
		else:
			self.position = target.normalized() * (target.length() - buffer) * 0.05
