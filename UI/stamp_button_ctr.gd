extends MarginContainer

class_name StampButtonContainer

var stamp

var is_mouse_over = false
var selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_stamp_ui(node : Node):
	add_child(node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func clicked():
	get_node("/root/Main/MouseController").set_stamp(stamp)
	get_parent().reset_selection()
	selected = true
	
func _input(event):
	if event.is_action_pressed("select") and is_mouse_over:
		clicked()
		


func _on_mouse_entered():
	is_mouse_over = true


func _on_mouse_exited():
	is_mouse_over = false
