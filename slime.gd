extends KinematicBody

var velocity = Vector3()
export var direction = 1

var is_dead = false


func dead():
	if is_dead == true:
		move_lock_x
		



func _physics_process(delta):
	move_lock_y
	
	
	if is_dead == false:
		if is_on_wall():
			direction = direction * -1
		
		velocity.x = 4 * direction
		
		velocity = move_and_slide(velocity,Vector3.UP)
		pass














