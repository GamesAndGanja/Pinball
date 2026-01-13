extends Node
signal ring_scored(ring_score : int)
signal tribumper_scored(tribumper_score : int)
signal spinner_scored(total_spinner_score : int)

signal collapse_wall_created(group : int)
signal collapse_wall_scored(group : int)
signal collapse_wall_reset(group : int)

signal rail_created(group : int)
signal rail_activated(group : int, state: bool)
signal rail_reset(group : int)

signal tilt_right(power : int)
signal tilt_left(power : int)

signal launch_power_changed(power : float)

signal score_changed(score : int)
signal multiplier_changed(multipler : int)
