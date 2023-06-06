extends CanvasLayer

#used https://www.youtube.com/watch?v=QEHOiORnXIk

@onready
var textBoxContainer = $TextBoxContainer
@onready
var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label

const READ_RATE = 0.05

enum State {
	READY,
	READING,
	DONE
}

var curstate = State.READY
var text_queue = []



# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	queue_text("This is the toutorial, spam t and press on the text box to continue")
	queue_text("your character moves with w, s and the space bar. figure it out")
	queue_text("if you are close to a mirror, press r to rotate it, please dont stand on them they are sensitive")
	queue_text("press left click to shoot the lazer, push and rotate the mirrors so the lazer hits the reciever")
	queue_text("what are you waiting for?")
	queue_text("dont you dare press t again")
	queue_text("well look what you did")
	queue_text("come on")
	queue_text("really?")
	queue_text("dork")
	pass # Replace with function body.

func queue_text(next_text):
	text_queue.push_back(next_text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if curstate == State.READY:
		if len(text_queue) != 0:
			display_text()
	elif curstate == State.READING:
		if Input.is_action_just_pressed("Text"):
			label.visible_ratio = 1.0
			curstate = State.DONE
	else:
		if Input.is_action_just_pressed("Text"):
			curstate = State.READY
			hide_textbox()
	
func hide_textbox():
	label.text = ""
	textBoxContainer.hide()

func show_textbox():
	textBoxContainer.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_ratio = 0
	curstate = State.READING
	show_textbox()
	var tweener = create_tween()
	tweener.tween_property(label, "visible_ratio", 1, 3)
	
	#tweener.interpolate_property(label, "visible_ratio", 1, 2)
	#0.0, 1.0, 0 len(next_text) * READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	



