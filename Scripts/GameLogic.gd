class_name GameLogic
extends Node

static var enemy_kill_count: int = 0
@export var enemyInstance: PackedScene

func spawnEnemy():
	var enemy: Enemy = enemyInstance.instantiate()
	enemy.position = Vector3(0, 1, 0)
	print(get_parent())
	add_child(enemy)

func _ready() -> void:
	spawnEnemy()

func _on_timer_timeout() -> void:
	spawnEnemy()
