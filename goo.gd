extends Area

#var move = Vector3.ZERO
var look_vec = Vector3.ZERO
onready var player = get_tree().get_root().get_node("world/player")
var speed = 3


func _ready():
	if player != null:
		print("look at player")
		look_at(player.get_global_transform().origin,Vector3.UP)
	else:
		print("can't find player")
		
		
func _physics_process(delta):
	#var move = Vector3.ZERO
	
	
	translate(transform.basis.x * speed * delta)
	#move = move.normalized() * speed
	#translation += move
