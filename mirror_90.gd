class_name mirror_90 extends CharacterBody2D

const pushspeed = 100

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready
var pushR = $Right
@onready
var pushL = $Left
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if pushL.has_overlapping_bodies():
		print("here")
		velocity.x -= delta*pushspeed
	elif pushR.has_overlapping_bodies():
		velocity.x += delta*pushspeed
	else: 
		velocity.x = 0
		
	
	
	move_and_slide()
