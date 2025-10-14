class_name Player
extends Node3D

var healthbar
@export var move_speed:float = 5
@export var health: int = 3

var damage_timer: float = 0
var move_inputs: Vector2

@export var gameOverScene: GameOver
@export var animationTree: AnimationTree

func _ready() -> void:
	healthbar = $RigidBody3D/SubViewport/HealthBar
	healthbar.max_value = health

func _process(delta:float) -> void:
	if damage_timer > 0:
		damage_timer = max(0, damage_timer - delta)
	
	if Input.is_action_just_pressed("damage_player"):
		health -= 1
		healthbar.update(health)
	
func _physics_process(delta: float) -> void:
	read_move_inputs()
	move_inputs *= move_speed * delta
	if move_inputs != Vector2.ZERO:
		global_position += Vector3(move_inputs.x, 0.0, move_inputs.y)
		animationTree.set("parameters/conditions/idle", false)
		animationTree.set("parameters/conditions/running", true)
	else:
		animationTree.set("parameters/conditions/idle", true)
		animationTree.set("parameters/conditions/running", false)
	return

func read_move_inputs():
	move_inputs.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_inputs.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	move_inputs = move_inputs.normalized()
	return

func damage(x):
	if damage_timer > 0: return
	
	health -= x
	if health < 0: health = 0
	healthbar.update(health)
	damage_timer = 1
	
	if health == 0:
		die()

func die():
	gameOverScene.visible = true
