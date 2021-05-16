extends PathFollow


export var runspeed = 5


func _process(delta):
	set_offset(get_offset() + runspeed * delta)
