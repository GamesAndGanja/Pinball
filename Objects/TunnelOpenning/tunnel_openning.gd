extends Node2D
@export_range(2,16) var collision_layer : int = 2

@onready var tunnel_walls : RigidBody2D = $side_walls
@onready var exit_line : Area2D = $exit_line
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tunnel_walls.set_collision_layer_value(collision_layer, true)
	tunnel_walls.set_collision_mask_value(collision_layer, true)
	exit_line.set_collision_layer_value(collision_layer, true)
	exit_line.set_collision_mask_value(collision_layer, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enter_line_body_entered(body: Node2D) -> void:
		body.set_collision_layer_value(1, false)
		body.set_collision_layer_value(collision_layer, true)
		body.set_collision_mask_value(1, false)
		body.set_collision_mask_value(collision_layer, true)

func _on_exit_line_body_entered(body: Node2D) -> void:
		body.set_collision_layer_value(1, true)
		body.set_collision_layer_value(collision_layer, false)
		body.set_collision_mask_value(1, true)
		body.set_collision_mask_value(collision_layer, false)
