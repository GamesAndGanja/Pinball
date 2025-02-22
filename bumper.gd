extends Node2D
@onready var bumper_block = $spring/block
var intensity = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("pull_bumper"):
		bumper_block.apply_impulse(Vector2.DOWN * clamp(intensity, 10, 5000) * delta)
		intensity += 2.5
	if Input.is_action_just_released("pull_bumper"):
		intensity = 10
	bumper_block.position = clamp(bumper_block.position, Vector2(-5, -100), Vector2(5, 60))
	pass
