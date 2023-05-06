extends Node2D

var level_names = [
	"heart",
	"house",
	"smiley",
	"tree"
]

func load_grid(grid):
	$SourceGrid.display_level(grid)
	
func load_stamps(stamps):
	$Stamps.stamps_data = stamps
	$Stamps.create_stamps()
	$Camera2D/UI.show_stamps()
	
func load_level(level_int: int):
	var level = LevelLoader.load_level(level_names[level_int])
	var grid = level[0]
	var stamps = level[1]
	load_grid(grid)
	load_stamps(stamps)
	
func _ready():
	load_level(0)
