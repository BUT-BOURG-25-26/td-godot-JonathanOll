extends CharacterBody3D

@onready var player := $"../Player"

const SPEED = 4

func _process(delta: float) -> void:
	if not player : return
	
	handle_movement()
	handle_collision()

func handle_movement():
	var direction: Vector3 = player.position - position
	direction = direction.normalized() * SPEED
	
	velocity = direction
	move_and_slide()

func handle_collision():
	for i in range(get_slide_collision_count()):
		var collider = get_slide_collision(i).get_collider()
		
		if collider.get_parent_node_3d() and \
		   collider.get_parent_node_3d().get_parent_node_3d() and\
		   collider.get_parent_node_3d().get_parent_node_3d() == player:
			player.damage(1)
		
	
