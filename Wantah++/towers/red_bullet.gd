extends CharacterBody2D

var target
var Speed = 1000
var pathName = ""
var bulletDamage

func _physics_process(delta):
	
	var pathSpawnerNode = get_tree().get_root().get_node("Main/PathSpawner")
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position

	velocity = global_position.direction_to(target) *Speed
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Pocong" in body.name:
		body.health -= bulletDamage
		queue_free()

func look_follow(state: PhysicsDirectBodyState3D, current_transform: Transform3D, target_position: Vector3) -> void:
	var forward_local_axis: Vector3 = Vector3(1, 0, 0)
	var forward_dir: Vector3 = (current_transform.basis * forward_local_axis).normalized()
	var target_dir: Vector3 = (target_position - current_transform.origin).normalized()
	var Speed: float = clampf(Speed, 0, acos(forward_dir.dot(target_dir)))
	if forward_dir.dot(target_dir) > 1e-4:
		state.angular_velocity = Speed * forward_dir.cross(target_dir) / state.step

func _integrate_forces(state):
	var target_position = $my_target_node3d_node.global_transform.origin
	look_follow(state, global_transform, target_position)
