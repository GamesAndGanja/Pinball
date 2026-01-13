extends Node2D
var score : float = 0
var multiplier : int = 1
var collapsable_walls_array : Array[Dictionary] = []
var rails_array : Array[Dictionary] = []
@export_range(0.5, 100) var wall_multiplier : float = 1.5
@export_range(0.5, 100) var rail_multiplier : float = 2
@export_range(1, 10) var tilt_power : int = 1

func _ready() -> void:
	SignalBus.ring_scored.connect(_on_ring_scored)
	SignalBus.tribumper_scored.connect(_on_tribumper_scored)
	SignalBus.spinner_scored.connect(_on_spinner_scored)
	
	SignalBus.collapse_wall_created.connect(_on_collapse_wall_created)
	SignalBus.collapse_wall_scored.connect(_on_collapse_wall_scored)
	
	SignalBus.rail_created.connect(_on_rail_created)
	SignalBus.rail_activated.connect(_on_rail_activated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in collapsable_walls_array.size():
		if collapsable_walls_array[i].total == collapsable_walls_array[i].active:
			multiplier += wall_multiplier
			collapsable_walls_array[i].active = 0
			SignalBus.collapse_wall_reset.emit(i)
			SignalBus.multiplier_changed.emit(multiplier)
			#print("Collapse Wall Mult added: "+ str(wall_multiplier) + ", reset walls" )
	for i in rails_array.size():
		if rails_array[i].total == rails_array[i].active:
			multiplier += rail_multiplier
			rails_array[i].active = 0
			SignalBus.rail_reset.emit(i)
			SignalBus.multiplier_changed.emit(multiplier)
			#print("Rails Mult added: "+ str(rail_multiplier) + ", reset walls" )
			
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("left_tilt"):
		SignalBus.tilt_left.emit(tilt_power * 100)
	if Input.is_action_just_pressed("right_tilt"):
		SignalBus.tilt_right.emit(tilt_power * 100)

# Ring Scoreing

func _on_ring_scored(ring_score: int) -> void:
	var score_with_mult = ring_score * multiplier
	score += score_with_mult
	SignalBus.score_changed.emit(score)
	#print(score)

# Spinner Scoring

func _on_spinner_scored(spinner_score : int) -> void:
	var score_with_mult = spinner_score * multiplier
	score += score_with_mult
	SignalBus.score_changed.emit(score)

# Tribumper Scoring

func _on_tribumper_scored(tribumper_score : int) -> void:
	var score_with_mult = tribumper_score * multiplier
	score += score_with_mult
	SignalBus.score_changed.emit(score)

# Collapse Wall setup

func _on_collapse_wall_created(group: int) -> void:
	if collapsable_walls_array.size() - 1 >= group:
		collapsable_walls_array[group].total += 1
	else:
		collapsable_walls_array.append({"total": 1, "active": 0})

func _on_collapse_wall_scored(group: int) -> void:
	collapsable_walls_array[group].active += 1

# Rails setup

func _on_rail_created(group: int) -> void:
	if rails_array.size() - 1 >= group:
		rails_array[group].total += 1
	else:
		rails_array.append({"total": 1, "active": 0})

func _on_rail_activated(group: int, state: bool) -> void:
	if state:
		rails_array[group].active += 1
	else:
		rails_array[group].active -= 1
