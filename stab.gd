extends KinematicBody

onready var time_sword = $time_sword




func _physics_process(delta):
	$time_sword.wait_time += 1
	print($time_sword.wait_time)
	if $time_sword.wait_time> 5:
		queue_free()

