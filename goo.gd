extends Area

var move = Vector3.ZERO
var look_vec = Vector3.ZERO
var player = null
var speed = 3


func _ready():
	
	look_vec = player.position - global_position
	
func _physics_process(delta):
	move = Vector3.ZERO
	
	
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move
