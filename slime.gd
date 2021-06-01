extends KinematicBody

onready var goo_scene = preload("res://goo.tscn")


var velocity = Vector3()
export var direction = 1

var is_dead = false



func dead():
	queue_free()



func _physics_process(delta):
	
	if is_dead == false:
		if is_on_wall():
			direction = direction * -1
		
		velocity.x = 2 * direction
		
		velocity = move_and_slide(velocity,Vector3.UP)
		pass


func fire():
	var goo = goo_scene.instance()
	goo.position = get_global_position()
	goo.player = player
	get_parent().get_child(goo)
	$timer.set_wait_tire(1)


func _on_timer_timeout():
	if player != null:
		fire()









func _on_Area_body_entered(body):
	if body.name == "player":
		dead()


func _on_Area2_body_entered(body):
	if body != self:
		player = body


func _on_Area2_body_exited(body):
	player = null
