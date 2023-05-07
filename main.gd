extends Node2D

class_name Main

var SPRITE_TEXTURE_OFFSET = 4
var SPRITE_TEXTURE_SIZE = 32
var SPRITE_SIZE = SPRITE_TEXTURE_SIZE + SPRITE_TEXTURE_OFFSET

const CONTENT_WIDTH = .8

signal level_loaded


const level_names = [
	"neco", # TODO: remove before publishing!
	"heart",
	"tree",
	"smiley",
	"house",
	"glass",
	"apple",
	"robot",
	"banana",
	"potion",
	"ketchup-mustard",
	"devil",
	"pears",
	"flower",
	"car",
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
	$Grid.hide()
	$SourceGrid.hide()
	$CanvasLayer.hide()
	var completed_grid_node = load("res://completed_grid.tscn").instantiate()
	add_child(completed_grid_node)
	
	completed_grid_node.init_grid($Grid.GRID_ROW_AMOUNT, $Grid.GRID_COL_AMOUNT)
	completed_grid_node.move_history = $Grid.move_history
	completed_grid_node.animate()
	


func _ready():
	load_level(get_node("/root/Global").level_to_load)
	$ResponsiveController.resized()


func _process(delta):
	pass

func to_menu():
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
