extends RigidBody2D
enum flipper_sides {RIGHT, LEFT}
@export var flipper_type : flipper_sides
@export var flipper_speed : int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if flipper_type == flipper_sides.RIGHT:
		self.rotation_degrees = 60
	else:
		self.rotation_degrees = -60
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var flipper_rotation
	if flipper_type == flipper_sides.RIGHT:
		if Input.is_action_pressed("right_flipper"):
			flipper_rotation = clamp(self.rotation_degrees + flipper_speed * delta, 60, 120)
		else:
			flipper_rotation = clamp(self.rotation_degrees - flipper_speed * delta, 60, 120)
		
	else:
		if Input.is_action_pressed("left_flipper"):
			flipper_rotation = clamp(self.rotation_degrees - flipper_speed * delta, -120, -60)
		else:
			flipper_rotation = clamp(self.rotation_degrees + flipper_speed * delta, -120, -60)
	self.rotation_degrees = flipper_rotation
	pass
