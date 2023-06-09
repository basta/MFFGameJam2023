extends Node

var tile_size: float;
var left_grid: Grid;
var right_grid: Grid;
var stamps_ui
var GRID_MARGIN = 50;
var GRID_MARGIN_TOP = 180;
var STAMPS_MARGIN_BOT = 10;
var main_node;

func _ready():
	main_node = get_node("/root/Main")
	get_tree().get_root().connect("size_changed", resized)
	tile_size = get_node("/root/Main").SPRITE_SIZE
	left_grid = $"../SourceGrid"
	right_grid = $"../Grid"
	stamps_ui = $"../CanvasLayer/UI/Bottom/HBoxContainer"
	resized()


func resized():
	print("Resizing: ", get_viewport().size)
	print(calculate_grid_size($"../Grid"))
	calculate_margins()
	left_grid.position = calculate_grid_start_left(left_grid)
	right_grid.position = calculate_grid_start_right(right_grid)
	resize_background()
	center_celebration_if_exists()


func center_celebration_if_exists():
	if get_node_or_null("/root/Main/CompletedGrid") != null:
		var completed_grid_node = get_node("/root/Main/CompletedGrid")
		var grid_size = calculate_grid_size(completed_grid_node)/2
		var view_size = get_viewport().size / 2.
		completed_grid_node.position = view_size - grid_size
		
		var SLIDER_SIZE = 100
		var slider : HSlider = completed_grid_node.get_node("HSlider")
		slider.position = Vector2(grid_size.x - grid_size.x/2, -50)
		slider.size = Vector2(grid_size.x, 30)
		
func resize_background():
	$"../Background".scale = get_viewport().size / 2000.
	$"../Background".position = get_viewport().size / 2


func calculate_grid_size(grid: Grid) -> Vector2:
	return Vector2(
		grid.GRID_COL_AMOUNT * tile_size,
		grid.GRID_ROW_AMOUNT * tile_size
	)


#func calculate_tile_size():
#	var SPRITE_TEXTURE_SIZE = viewport_size.x * CONTENT_WIDTH / grid[0].size()
#	var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET


func calculate_margins():
	var grid_size = Vector2(left_grid.GRID_COL_AMOUNT * main_node.SPRITE_SIZE, left_grid.GRID_ROW_AMOUNT * main_node.SPRITE_SIZE)
	var stamps_height = stamps_ui.size.y
	var viewport_size = get_viewport().size
	GRID_MARGIN_TOP = clamp((viewport_size.y - grid_size.y - stamps_height) * .5, 20, 250)
	GRID_MARGIN = clamp((viewport_size.x - 2 * grid_size.x) / 4, 50, 100)


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
