class_name GameOver
extends VBoxContainer

@export var restartButton: Button
@export var quitButton: Button

func _ready() -> void:
	restartButton.pressed.connect(restart)
	quitButton.pressed.connect(quit)

func restart() -> void:
	get_tree().reload_current_scene()
	
func quit() -> void:
	get_tree().quit()
