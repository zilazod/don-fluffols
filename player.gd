extends KinematicBody

signal health_updated(health)
signal killed()

const move_speed = 7
const jump_force = 7
const gravity = 9.8
const max_fall_speed = 30
var y_velo = 0


export (float) var max_health = 100

onready var health = max_health setget _set_health

onready var invulnerability_timer = $invulnerabilityTimer

func _physics_process(delta):

	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	move_and_slide(Vector3(move_dir * move_speed, y_velo, 0), Vector3(0,1,0))

	var just_jumped = false
	var grounded = is_on_floor()
	y_velo -= gravity * delta
	if y_velo < -max_fall_speed:
		y_velo = -max_fall_speed
		
		
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = jump_force
			just_jumped = true

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
