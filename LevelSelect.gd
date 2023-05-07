extends Control


var SPRITE_TEXTURE_OFFSET = 4
var SPRITE_TEXTURE_SIZE = 32
var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET


# Called when the node enters the scene tree for the first time.
func _ready():
	var level = LevelLoader.load_level("pixtamp_logo")
	var grid = level[0]
	var stamps = level[1]
	$SourceGrid.init_grid(grid.size(), grid[0].size())
	$SourceGrid.init_level(grid)
	
var level_to_load = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func select_level(n):
	var main_scene = load("res://main.tscn")
	get_node("/root/Global").level_to_load = n
	get_tree().change_scene_to_packed(main_scene)


func calculate_grid_size(grid: Grid) -> Vector2:
	return Vector2(
		grid.GRID_COL_AMOUNT * SPRITE_SIZE,
		grid.GRID_ROW_AMOUNT * SPRITE_SIZE
	)

func _process(delta):
	var grid_size = calculate_grid_size($SourceGrid) / 2.
	var view_size = get_viewport().size / 2.
	$SourceGrid.position.x = (view_size - grid_size).x
	$SourceGrid.position.y = clamp((view_size - grid_size).y, 0, 100)
	$MarginContainer.add_theme_constant_override("margin_bottom", view_size.y * 2 - grid_size.y * 2 - 450)
	
	
	
