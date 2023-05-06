extends Node
var tile_size: float;
var left_grid: Grid;
var right_grid: Grid;
var GRID_MARGIN = 50;
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
	
	left_grid.position = calculate_grid_start_left(left_grid)
	right_grid.position = calculate_grid_start_right(right_grid)
	resize_background()

#func adjust_sprite_size():
#	var SPRITE_TEXTURE_SIZE = viewport_size.x * CONTENT_WIDTH / grid[0].size()
#	var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET

func resize_background():
	$"../Background".scale = get_viewport().size
	$"../Background".position = get_viewport().size/2
	
	
func calculate_grid_size(grid: Grid) -> Vector2:
	return Vector2(
		grid.GRID_COL_AMOUNT * tile_size,
		grid.GRID_ROW_AMOUNT * tile_size
	)
	
func calculate_grid_start_left(grid: Grid):
	var middle = get_viewport().size/2
	var grid_size = calculate_grid_size($"../Grid")
	return Vector2(middle) - Vector2(grid_size.x, grid_size.y/2) + Vector2.LEFT * GRID_MARGIN
	
func calculate_grid_start_right(grid: Grid):
	var middle = get_viewport().size/2
	return Vector2(middle) + calculate_grid_size($"../Grid").y/2 * Vector2.UP + Vector2.RIGHT * GRID_MARGIN
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
