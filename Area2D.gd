extends Area2D

var taken = false
# Called when the node enters the scene tree for the first time.
func _on_body_entered(_body):
	get_node("/").score += 100

		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
