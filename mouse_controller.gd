extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_stamp(stamp):
	$CurrentStamp.enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CurrentStamp.global_position = get_viewport().get_mouse_position()
	
