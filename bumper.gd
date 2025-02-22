extends Node2D
@onready var bumper_block = $spring/block

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("pull_bumper"):
		bumper_block.apply_impulse(Vector2.DOWN * 85)
	bumper_block.position = clamp(bumper_block.position, Vector2(-10, -100), Vector2(10, 50))
	pass
