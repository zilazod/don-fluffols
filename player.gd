extends KinematicBody



const move_speed = 7
const jump_force = 7
const gravity = 9.8
const max_fall_speed = 30
var y_velo = 0


func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	move_and_slide(Vector3(move_dir * move_speed, y_velo, 0), Vector3(0,1,0))

	var just_jumped = false
	var grounded = is_on_floor()
	y_velo -= gravity * delta
	if y_velo < -max_fall_speed:
		y_velo = -max_fall_speed
		
		
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = jump_force
			just_jumped = true




 




