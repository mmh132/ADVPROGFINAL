extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const maxLazerDist = 10000
const pi = 3.14159265358

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready
var ray = $RayCast2D
@onready
var line = $Line2D
@onready
var texture = $Line2D/Laser

var prev = null
var push:int = 0


signal win

func _ready():
	var transition = get_node("/root/TransitionScenes")
	connect("win", transition.next_level)
	pass

func _process(delta):
	line.clear_points()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		
		line.add_point(Vector2(0,0))
		ray.global_position = line.global_position
		#print(self.rotation_degrees)
		#ray.target_position = Vector2(cos((self.rotation_degrees)*(pi/180)), sin((self.rotation_degrees)*(pi/180))).normalized() * maxLazerDist
		ray.target_position = Vector2(maxLazerDist, 0)
		ray.force_raycast_update()
	
		while true:
			
			if ray.is_colliding() == false:
				var pt = ray.global_position + ray.target_position
				line.add_point(line.to_local(pt))
				break
			
			var collision = ray.get_collider()
			var pt = ray.get_collision_point()
			line.add_point(line.to_local(pt))
			
			
			if collision.is_in_group("power_station"):
				print("winning")
				win.emit()
				break
				
			if not collision.is_in_group("mirror"):
				break	
			var norm = ray.get_collision_normal()
			
			if norm == Vector2(0,0):
				break		
			
			ray.global_position = pt
			ray.target_position = ray.target_position.bounce(norm)
			ray.force_raycast_update()
	pass

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta
	
	#move_and_slide()
	pass


func _on_win():
	pass # Replace with function body.
