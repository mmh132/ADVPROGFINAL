extends CanvasLayer

var level = 1

#@onready var emitter = preload("res://emitter.gd")


# Called when the node enters the scene tree for the first time.
func next_level():
	if level == 1:
		change_scene("res://Level1.tscn")
	if level == 2:
		change_scene("res://Level2.tscn")
	if level == 3:
		pass
	pass
	


func change_scene(target):
	$AnimationPlayer.play("Dissolve")
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("Dissolve")
