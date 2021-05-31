extends KinematicBody

var velocity = Vector3()
export var direction = 1

var is_dead = false



func dead():
	queue_free()



func _physics_process(delta):
	
	if is_dead == false:
		if is_on_wall():
			direction = direction * -1
		
		velocity.x = 4 * direction
		
		velocity = move_and_slide(velocity,Vector3.UP)
		pass



















func _on_Area_body_entered(body):
	if body.name == "player":
		dead()
