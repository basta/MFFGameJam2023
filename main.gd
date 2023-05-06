extends Node2D

var SPRITE_TEXTURE_OFFSET = 4
var SPRITE_TEXTURE_SIZE = 32
var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET

const CONTENT_WIDTH = .8


var level_names = [
	"heart",
	"tree",
	"smiley",
	"house",
	"glass",
	"apple",
	"robot",
	"banana",
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
	var viewport_size = get_viewport().size
	# SPRITE_TEXTURE_SIZE = viewport_size.x * CONTENT_WIDTH / grid[0].size()
	# SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET
	load_grid(grid)
	load_stamps(stamps)


func is_level_solved() -> bool:
	return $Grid.data_matrix == $SourceGrid.data_matrix


func _ready():
	load_level(0)


func _process(delta):
	print_debug(is_level_solved())
