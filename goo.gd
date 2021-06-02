extends Area

#var move = Vector3.ZERO
var look_vec = Vector3.ZERO
onready var player = get_tree().get_root().find_node("player")
var speed = 3


func _ready():
	if player != null:
		look_at(player.get_global_translation(),Vector3.UP)
	
func _physics_process(delta):
	#var move = Vector3.ZERO
	
	
	translate(transform.basis.x * speed * delta)
	#move = move.normalized() * speed
	#translation += move
