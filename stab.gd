extends Spatial

onready var time_sword = $time_sword




func _physics_process(delta):
	$time_sword.wait_time += 0.1
	if $time_sword.wait_time> 6:
		Global.created = false
		queue_free()
	
	
	


func _on_Area_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
