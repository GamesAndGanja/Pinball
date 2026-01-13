extends VBoxContainer
@onready var Score = $Score
@onready var Multiplier = $Multiplier
@onready var LaunchBar = $LaunchContainer/LaunchBar

func _ready() -> void:
	SignalBus.score_changed.connect(_on_score_changed)
	SignalBus.multiplier_changed.connect(_on_multiplier_changed)
	SignalBus.launch_power_changed.connect(_on_launch_power_changed)

func _on_score_changed(score : int) -> void:
	Score.text = "Score: %d" % score

func _on_multiplier_changed(multiplier : int) -> void:
	Multiplier.text = "Mutiplier: %d" % multiplier

func _on_launch_power_changed(power : float) -> void:
	LaunchBar.value = power
