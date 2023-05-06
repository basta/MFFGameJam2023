extends Node2D

var SPRITE_TEXTURE_OFFSET = 4
var SPRITE_TEXTURE_SIZE = 32
var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET

const CONTENT_WIDTH = .8

signal level_loaded


var level_names = [
	"neco",
	"heart",
	"tree",
	"smiley",
	"house",
	"glass",
	"apple",
	"robot",
	"banana",
	"potion",
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
	load_grid(grid)
	load_stamps(stamps)
	level_loaded.emit()

func is_level_solved() -> bool:
	return $Grid.data_matrix == $SourceGrid.data_matrix


func play_congrats_scene():
	var root_node = get_node("/root")
	
	var congrats_scene = load("res://level_completed.tscn").instantiate()
	root_node.add_child(congrats_scene)
	var completed_grid_node = congrats_scene.get_node("CompletedGrid")
	completed_grid_node.init_grid($Grid.GRID_ROW_AMOUNT, $Grid.GRID_COL_AMOUNT)
	completed_grid_node.move_history = $Grid.move_history
	
	var main_node = root_node.get_node("Main")
	root_node.remove_child(main_node)
	main_node.call_deferred("free")
	
	completed_grid_node.animate()


func _ready():
	load_level(1)


func _process(delta):
	if is_level_solved():
		play_congrats_scene()

