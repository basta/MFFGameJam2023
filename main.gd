extends Node2D


var level_names = [
	"heart",
	"house",
	"smiley",
	"tree"
]


func load_grid(grid):
	$Grid.init_grid(grid.size(), grid[0].size())
	$SourceGrid.init_grid(grid.size(), grid[0].size())
	$SourceGrid.init_level(grid)


func load_stamps(stamps):
	$Stamps.stamps_data = stamps
	$Stamps.create_stamps()
	$CanvasLayer/UI.show_stamps()


func load_level(level_int: int):
	var level = LevelLoader.load_level(level_names[level_int])
	var grid = level[0]
	var stamps = level[1]
	load_grid(grid)
	load_stamps(stamps)


func _ready():
	load_level(2)
