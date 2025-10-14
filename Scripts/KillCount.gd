extends Label

func _process(delta: float) -> void:
	text = str(GameLogic.enemy_kill_count) + " kills"
