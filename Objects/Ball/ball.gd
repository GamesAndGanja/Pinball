extends RigidBody2D

func _ready() -> void:
	SignalBus.tilt_left.connect(onTiltLeft)
	SignalBus.tilt_right.connect(onTiltRight)

func onTiltRight(power) -> void:
	self.apply_force(Vector2(power, 0))

func onTiltLeft(power) -> void:
	self.apply_force(Vector2(-power, 0))
