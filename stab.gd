extends KinematicBody

onready var time_sword = $time_sword

const move_speed = 7
var y_velo = 0
const jump_force = 7
const gravity = 9.8
const max_fall_speed = 30



func _physics_process(delta):
	$time_sword.wait_time += 1
	if $time_sword.wait_time> 10:
		Global.created = false
		queue_free()
	
	
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
		
		
		
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
		
		
		
	
	move_and_slide(Vector3(move_dir * move_speed, y_velo, 0), Vector3(0,1,0))
	
	
	
	
