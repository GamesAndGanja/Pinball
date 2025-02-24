extends Area2D
@export var light : Polygon2D
@export var activated_light : Color
var base_color : Color
@export var rail_state : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_color = light.color
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rail_state == false:
		light.color = base_color
	else:
		light.color = activated_light
	pass



func _on_body_entered(body: Node2D) -> void:
	rail_state = !rail_state
