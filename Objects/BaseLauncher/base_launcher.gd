extends RapierArea2D
var launch_power : float = 0

func _process(delta: float) -> void:
	if Input.is_action_pressed("pull_bumper"):
		launch_power = clamp(launch_power + delta * 3000, 0, 5000)
		SignalBus.launch_power_changed.emit(launch_power)
	if Input.is_action_just_released("pull_bumper"):
		if self.has_overlapping_bodies():
			var bodies = self.get_overlapping_bodies()
			bodies[0].apply_force(Vector2(0, -launch_power))
		launch_power = 0
		SignalBus.launch_power_changed.emit(launch_power)
