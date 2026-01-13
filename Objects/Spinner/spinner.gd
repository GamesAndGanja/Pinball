extends RapierArea2D
@export var spinner_force : int = 150
@export var spin_score : int = 5


func _on_body_entered(body: RigidBody2D) -> void:
	var velocity = body.get_linear_velocity()
	var spins_amount = roundi(velocity.y / spinner_force)
	var total_score = spins_amount * spin_score
	if total_score > 0:
		SignalBus.spinner_scored.emit(total_score)
