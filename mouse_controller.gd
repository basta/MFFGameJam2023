extends Node


var stamps


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_stamp(stamp):
	stamps.current_stamp = stamp
	print_debug("Selected stamp: ", stamp)
	get_node("/root/Main/Grid").cursor.set_size(stamp.SIZE_Y, stamp.SIZE_X)
	get_node("/root/Main/SourceGrid").cursor.set_size(stamp.SIZE_Y, stamp.SIZE_X)


func reset():
	stamps.current_stamp = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var grid_node: Grid = get_node("/root/Main/Grid")
	var source_grid_node: Grid = get_node("/root/Main/SourceGrid")
	if not grid_node || not source_grid_node:
		return
	var index_pos = grid_node.get_xy_from_global_pos(get_parent().get_node("Grid").get_global_mouse_position())
	if stamps.current_stamp:
		grid_node.place_cursor(index_pos)
		source_grid_node.place_cursor(index_pos)
	else:
		grid_node.cursor.disable()
		source_grid_node.cursor.disable()


func _input(event):
	if event.is_action_pressed("select"):
		var main_node: Main =  get_node("/root/Main")
		var grid_node: Grid = main_node.get_node("Grid")
		var index_pos = grid_node.get_xy_from_global_pos(get_parent().get_node("Grid").get_global_mouse_position())
		if stamps.current_stamp && grid_node.is_cursor_valid(index_pos):
			grid_node.apply_stamp(index_pos.x, index_pos.y, stamps.current_stamp.stamp_matrix)
			if main_node.is_level_solved():
				main_node.play_congrats_scene()

