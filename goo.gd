extends Area

#var move = Vector3.ZERO
var look_vec = Vector3.ZERO
onready var player = get_tree().get_root().get_node("world/player")
var speed = 5
var g = Vector3.DOWN * 3
var velocity = Vector3.ZERO


func _ready():
	if player != null:
		#print("look at player")
		#look_at(player.get_global_transform().origin,Vector3.UP)
		pass
	else:
		#print("can't find player")
		pass
		
		
func _physics_process(delta):
	#var move = Vector3.ZERO
	velocity += g * delta
	#look_at(player.get_global_transform().origin,Vector3.UP)
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta
	#move = move.normalized() * speed
	#translation += move




func _on_goo_body_entered(body):
	if body.name == "player":
		queue_free()
