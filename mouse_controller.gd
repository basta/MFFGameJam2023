extends Node

var stamp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_stamp(new_stamp):
	stamp = new_stamp
	print_debug("Selected stamp: ", new_stamp)

func reset():
	stamp = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CurrentStamp.global_position = get_viewport().get_mouse_position()
	
func _input(event):
	if event.is_action_pressed("select"):
		var grid_node: Grid = get_node("/root/Main/Grid")
		var index_pos = grid_node.get_xy_from_global_pos(event.position)
		var pattern = [
				[Color(1,0,0,1), Color(1,0,0,1)],
				[Color(1,0,0,1), Color(1,0,0,1)],
			]
			
		grid_node.apply_stamp(index_pos.x, index_pos.y, pattern)
		
