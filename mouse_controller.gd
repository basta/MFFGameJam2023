extends Node

var stamp : Stamp


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_stamp(new_stamp):
	stamp = new_stamp
	print_debug("Selected stamp: ", new_stamp)
	get_node("/root/Main/Grid").cursor.set_size(stamp.SIZE_X, stamp.SIZE_Y)


func reset():
	stamp = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var grid_node: Grid = get_node("/root/Main/Grid")
	if stamp:
		grid_node.place_cursor(get_viewport().get_mouse_position())
	else:
		grid_node.cursor.disable()


func _input(event):
	if event.is_action_pressed("select"):
		var grid_node: Grid = get_node("/root/Main/Grid")
		var index_pos = grid_node.get_xy_from_global_pos(event.position)
		if stamp:
			grid_node.apply_stamp(index_pos.x, index_pos.y, stamp.stamp_matrix)

