extends Camera

onready var player_follow = get_parent().get_node("player")
var wait = 0

func _process(delta):
	var camera_pos = Vector3.ZERO
	camera_pos.x = player_follow.translation.x
	camera_pos.z = player_follow.translation.z
	camera_pos.y = get_translation().y
	set_translation(camera_pos)



