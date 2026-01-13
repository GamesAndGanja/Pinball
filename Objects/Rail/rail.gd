extends Area2D
@export var light : Polygon2D
@export var activated_light : Color
var base_color : Color
@export var rail_state : bool = false
@export_range(0,100) var rail_group : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_color = light.color
	SignalBus.rail_created.emit(self)
	SignalBus.rail_reset.connect(_on_rail_reset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rail_state == false:
		light.color = base_color
	else:
		light.color = activated_light
	pass



func _on_body_entered(body: Node2D) -> void:
	rail_state = !rail_state

func _on_rail_reset(group: int) -> void:
	rail_state = false
