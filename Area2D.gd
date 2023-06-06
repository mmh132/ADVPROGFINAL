extends Area2D

var taken = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_monitorable(true)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var overlappingBodies = get_overlapping_bodies()
	if overlappingBodies:
		for body in overlappingBodies:
			if body.name == "Player":
				#print("playerin")
				if Input.is_action_just_pressed("Rotate"):
					#print("rotating")
					self.get_parent().degree += 90
			#else:
				#print("nobody aint here bucko")
					
