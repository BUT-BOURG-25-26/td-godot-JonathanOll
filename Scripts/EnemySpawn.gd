class_name EnemySpawn
extends Node

@export var enemyInstance: PackedScene

func spawnEnemy():
	var enemy: Enemy = enemyInstance.instantiate()
	enemy.position = Vector3(0, 1, 0)
	add_child(enemy)

func _ready() -> void:
	spawnEnemy()

func _on_timer_timeout() -> void:
	spawnEnemy()
	
