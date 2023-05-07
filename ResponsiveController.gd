extends Node

var tile_size: float;
var left_grid: Grid;
var right_grid: Grid;
var GRID_MARGIN = 50;
var GRID_MARGIN_TOP = 180;
var main_node;


func _ready():
	main_node = get_node("/root/Main")
	get_tree().get_root().connect("size_changed", resized)
	tile_size = get_node("/root/Main").SPRITE_SIZE
	left_grid = $"../SourceGrid"
	right_grid = $"../Grid"
	resized()


func resized():
	print("Resizing: ", get_viewport().size)
	print(calculate_grid_size($"../Grid"))
	calculate_margins()
	left_grid.position = calculate_grid_start_left(left_grid)
	right_grid.position = calculate_grid_start_right(right_grid)
	resize_background()
	center_celebration_if_exists()


#func adjust_sprite_size():
#	var SPRITE_TEXTURE_SIZE = viewport_size.x * CONTENT_WIDTH / grid[0].size()
#	var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET


func center_celebration_if_exists():
	if get_node_or_null("/root/Main/CompletedGrid") != null:
		var completed_grid_node = get_node("/root/Main/CompletedGrid")
		var grid_size = calculate_grid_size(completed_grid_node)/2
		var view_size = get_viewport().size / 2.
		completed_grid_node.position = view_size - grid_size


func resize_background():
	$"../Background".scale = get_viewport().size / 2000.
	$"../Background".position = get_viewport().size / 2
	
	
func calculate_grid_size(grid: Grid) -> Vector2:
	return Vector2(
		grid.GRID_COL_AMOUNT * tile_size,
		grid.GRID_ROW_AMOUNT * tile_size
	)


func calculate_margins():
	var grid_height = left_grid.GRID_ROW_AMOUNT * main_node.SPRITE_SIZE
	var stamps_height = main_node.get_node("CanvasLayer/UI/Bottom/HBoxContainer").size.y
	GRID_MARGIN_TOP = max(get_viewport().size.y - grid_height - stamps_height - 80, 50)
	print_debug(grid_height, " ", stamps_height, " -> ", GRID_MARGIN_TOP)


func calculate_grid_start_left(grid: Grid):
	var middle = get_viewport().size / 2
	var grid_size = calculate_grid_size($"../Grid")
	return Vector2(
		middle.x - grid_size.x - GRID_MARGIN,
		GRID_MARGIN_TOP
	)


func calculate_grid_start_right(grid: Grid):
	var middle = get_viewport().size / 2
	var grid_size = calculate_grid_size($"../Grid")
	return Vector2(
		middle.x + GRID_MARGIN,
		GRID_MARGIN_TOP
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
