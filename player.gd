extends KinematicBody
onready var stab_scene = preload("res://stab.tscn")

signal health_updated(health)
signal killed()

const move_speed = 7
const jump_force = 7
const gravity = 9.8
const max_fall_speed = 30
var y_velo = 0
var moving = false
var facing = 1

export (float) var max_health = 100

onready var health = max_health setget _set_health



onready var invulnerability_timer = $invulnerabilityTimer

func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
		facing = 1
		moving = true
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
		facing = -1
		moving = true
	if Input.is_action_just_released("move_right"):
		moving = false
	if Input.is_action_just_released("move_left"):
		moving = false
	move_and_slide(Vector3(move_dir * move_speed, y_velo, 0), Vector3(0,1,0))
	
	var just_jumped = false
	var grounded = is_on_floor()
	y_velo -= gravity * delta
	if y_velo < -max_fall_speed:
		y_velo = -max_fall_speed
		
	if facing == 1:
		rotate_y(180)
	if facing == -1:
		rotate_y(-180)

	
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = jump_force
			just_jumped = true
	if Input.is_action_pressed("attack"):
		if Global.created == false:
			if moving == false:
				var stab = stab_scene.instance()
				owner.add_child(stab)
				stab.transform = $sword.get_global_transform()
				Global.created = true
	
	
	
	

func flip():
	facing = facing*-1


func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
	_set_health(health - amount)

func kill():
	queue_free()

func _set_health(value):
	var prv_health = health
	health = clamp(value, 0, max_health)
	if health != prv_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")

func _on_Area_area_shape_entered(area_id, area, area_shape, local_shape):
	if area.is_in_group("Hit_Player"):
		print("end me")
		damage(10)




