extends Area2D
@export var light : Polygon2D
var base_light : Color
@export var active : bool = true
@export var active_color : Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_light = light.color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active == false:
		light.color = active_color
		$CollisionPolygon2D.disabled = false
	pass


func _on_body_entered(body: Node2D) -> void:
	active = false
