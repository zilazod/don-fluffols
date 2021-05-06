extends KinematicBody


const move_speed = 5
var y_velo = 0




func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	move_and_slide(Vector3(move_dir * move_speed, y_velo, 0), Vector3(0,1,0))



