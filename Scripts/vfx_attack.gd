class_name VFX
extends Area3D 

@onready var flash = $Flash
@onready var sparks = $Sparks
@onready var shockwave = $Shockwave
@onready var flare = $Flare

func emit():
	flash.emitting = true
	flare.emitting = true
	shockwave.emitting = true
	sparks.emitting = true


func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		body.queue_free()
		GameLogic.enemy_kill_count += 1
		
	

func _on_shockwave_finished() -> void:
	queue_free()
