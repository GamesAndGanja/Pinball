extends Node
signal ring_scored(ring_score : int)

signal collapse_wall_created(group : int)
signal collapse_wall_scored(group : int)
signal collapse_wall_reset(group : int)

signal rail_created(group : int)
signal rail_activated(group : int, state: bool)
signal rail_reset(group : int)
