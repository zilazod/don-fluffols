extends Area


func _on_Area_body_entered(body):
	get_tree().change_scene("res://world.tscn")
