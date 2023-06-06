extends CanvasLayer

var level = 1

# Called when the node enters the scene tree for the first time.
func next_level():
	if level == 1:
		change_scene("")
	
	pass
	


func change_scene(target):
	$AnimationPlayer.play("Dissolve")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("Dissolve")
