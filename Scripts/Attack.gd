extends Node3D

@export var vfxScene: PackedScene

@onready var cam = $Camera3D
const RAY_LENGTH = 1000

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var hit = ray_cast(event.position)
		if hit && (hit.collider.name == "Ground" or hit.collider.name == "Enemy"):
			create_vfx(hit.position)
			

func ray_cast(mousePos):
	var space_state = get_world_3d().direct_space_state
	
	var from = cam.project_ray_origin(mousePos)
	var to = from + cam.project_ray_normal(mousePos) * RAY_LENGTH
	var rayCaster = PhysicsRayQueryParameters3D.create(from, to)
	rayCaster.collide_with_areas = true
	
	var result = space_state.intersect_ray(rayCaster)
	return result
	
func create_vfx(pos):
	var node: VFX = vfxScene.instantiate()
	node.position = pos
	add_child(node)
	node.emit()
	
