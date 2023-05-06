extends Node2D

class_name Stamp


var grid_node_scene = preload("res://grid_node.tscn")


@export var SIZE_X := 3
@export var SIZE_Y := 3


var stamp_matrix : Array = []		# array of Colors


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func sprite_to_texture_rect(sprite: Sprite2D) -> TextureRect:
	var trect = TextureRect.new()
	trect.texture = sprite.texture
	trect.modulate = sprite.modulate
	return trect
	
func create_ui_grid() -> GridContainer:
	var grid_ctr = GridContainer.new()
	grid_ctr.columns = stamp_matrix[0].size()
	return grid_ctr


func generate_ui_node():
	var grid_ctr = create_ui_grid()
	for col in range(stamp_matrix[0].size()):
		for row in range(stamp_matrix.size()):
			if stamp_matrix[row][col] != null:
				var sprite = grid_node_scene.instantiate()
				sprite.set_grid_position(row, col)
				grid_ctr.add_child(sprite)
	return grid_ctr
	
