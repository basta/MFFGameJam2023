extends Node2D

class_name Stamp


var grid_node_scene = preload("res://grid_node.tscn")


@export var SIZE_X: int
@export var SIZE_Y: int


var stamp_matrix : Array = []		# array of Colors


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_matrix(matrix):
	stamp_matrix = matrix
	SIZE_X = matrix[0].size()
	SIZE_Y = matrix.size()


var small_tile_texture = preload("res://sprites/tile_round_small.svg")
var small_tile_border_texture = preload("res://sprites/tile_round_small_border.svg")


func sprite_to_texture_rect(grid_node: GridNode) -> TextureRect:
	var trect = TextureRect.new()
	var sprite = grid_node.get_node("Tile")
	trect.texture = small_tile_texture
	trect.modulate = sprite.modulate
	return trect


func create_ui_grid() -> GridContainer:
	var grid_ctr = GridContainer.new()
	grid_ctr.columns = stamp_matrix[0].size()
	return grid_ctr


func generate_ui_node():
	var grid_ctr = create_ui_grid()
	for row in range(stamp_matrix.size()):
		for col in range(stamp_matrix[0].size()):
			if stamp_matrix[row][col] != null:
				var color = stamp_matrix[row][col]
				var trect = sprite_to_texture_rect(grid_node_scene.instantiate())
				trect.modulate = color
				var trect_border = TextureRect.new()
				trect_border.texture = small_tile_border_texture
				var margin_container = MarginContainer.new()
				margin_container.add_child(trect)
				margin_container.add_child(trect_border)
				grid_ctr.add_child(margin_container)
	return grid_ctr
