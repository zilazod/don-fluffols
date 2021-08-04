extends KinematicBody

onready var time_sword = $time_sword




func _physics_process(delta):
	$time_sword.wait_time += 1
	if $time_sword.wait_time> 10:
		Global.created = false
		queue_free()
	
	
	
	
	
	
	
