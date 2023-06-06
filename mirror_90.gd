class_name mirror_90 extends RigidBody2D

var degree:int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if gravity_scale == 0:
		collision_mask = 8
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#rotation_degrees = 0
	pass
	
func _integrate_forces(state):
	angular_velocity = 0
	if self.freeze == true:
		self.freeze = false
		rotation_degrees = degree % 360
		self.freeze = true
	else: 
		rotation_degrees = degree % 360
	
	
