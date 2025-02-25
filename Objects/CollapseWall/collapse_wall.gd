extends Area2D
@export var light : Polygon2D
var base_light : Color
@export var active : bool = true
@export var active_color : Color
@export_range(0,100) var group : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_light = light.color
	SignalBus.collapse_wall_created.emit(group)
	SignalBus.collapse_wall_reset.connect(_on_collapse_wall_reset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active == false:
		light.color = active_color
		$CollisionPolygon2D.disabled = true
	else:
		light.color = base_light
		$CollisionPolygon2D.disabled = false
	pass


func _on_body_entered(body: Node2D) -> void:
	active = false
	SignalBus.collapse_wall_scored.emit(group)

func _on_collapse_wall_reset(sent_group: int) -> void:
	if group == sent_group:
		active = true
