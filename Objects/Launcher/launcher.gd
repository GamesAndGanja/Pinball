extends Area2D
enum State {ACTIVE, DISABLED}
@export var launcher_state : State
@export var timeout_length : float = 300
@export var launch_length : float = 1
@export var launch_power : int = 100
@onready var collisionbox = $CollisionShape2D
@onready var launch_timer = $launch_timer
@onready var timeout_timer = $timeout_timer
@export var launcher_wall : RigidBody2D
var launcher_wall_collision : CollisionPolygon2D
var current_ball : RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	launcher_wall_collision = launcher_wall.get_node("CollisionPolygon2D")
	launcher_wall_collision.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	current_ball = body.get_node(".")
	collisionbox.call_deferred("set_disabled", true)
	launcher_state = State.DISABLED
	body.position = self.position
	launcher_wall_collision.call_deferred("set_disabled", false)
	launch_timer.start()


func _on_launch_timer_timeout() -> void:
	current_ball.apply_impulse(Vector2.UP * launch_power)
	timeout_timer.start()


func _on_timeout_timer_timeout() -> void:
	collisionbox.disabled = false
	launcher_wall_collision.disabled = true
