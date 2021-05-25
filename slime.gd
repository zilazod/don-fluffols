extends KinematicBody

var velocity = Vector3()
export var direction = 1

func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1
	
	velocity.x = 4 * direction
	
	velocity = move_and_slide(velocity,Vector3.UP)
	pass














