extends VBoxContainer

@export var playButton: Button
@export var quitButton: Button

@export var gameScene: PackedScene

func _ready() -> void:
	playButton.pressed.connect(start)
	quitButton.pressed.connect(quit)

func start() -> void:
	get_tree().change_scene_to_packed(gameScene)

func quit() -> void:
	get_tree().quit()
