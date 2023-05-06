extends Button

@export var stamp: Node2D;

var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_up():
	get_node("/root/Main/MouseController").set_stamp(stamp)
	get_parent().get_parent().reset_selection()
	selected = true
