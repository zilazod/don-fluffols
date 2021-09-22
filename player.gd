extends KinematicBody
onready var stab_scene = preload("res://stab.tscn")

signal health_updated(health)
signal killed()

const move_speed = 5
const jump_force = 5
const gravity = 9.8
const max_fall_speed = 30
var y_velo = 0
var idle = true
var attack = false
var wait = 0
onready var animator = $AnimationTree.get("parameters/playback")

export (float) var max_health = 100

onready var health = max_health setget _set_health

func _ready():
	animator.travel("idle")


onready var invulnerability_timer = $invulnerabilityTimer

func _physics_process(delta):
	
	if animator.get_current_node() == "attack":
		return
	
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
		$sword.translation.x = 1
		
		
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
		$sword.translation.x = -1
	
	
	if move_dir != 0:
		animator.travel("run")
		if move_dir > 0:
			$Sprite3D.flip_h = false
		elif move_dir < 0:
			$Sprite3D.flip_h = true
	if move_dir == 0 and attack == false:
		animator.travel("idle")
		
	

			
		
	var velocity = Vector3(move_dir * move_speed, y_velo,0)
	move_and_slide(velocity, Vector3(0,1,0))
	
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
	
	elif not grounded:
		if velocity.y < 0:
			animator.travel("fall")
		else:
			animator.travel("jump")
			
	if grounded:
		if Input.is_action_pressed("attack"):
			if Global.created == false:
				animator.travel("attack")
				var stab = stab_scene.instance()
				
				add_child(stab)
				stab.transform = $sword.transform
				Global.created = true
			
#	if wait >= 1:
#		attack = true
#		wait += 0.1
#
#	if wait > 8:
#		attack = false
#		wait = 0
	
	
	


func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
	_set_health(health - amount)

func kill():
	get_tree().change_scene("res://world.tscn")

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













