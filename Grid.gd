extends Node2D

class_name Grid
var grid_node_scene = preload("res://grid_node.tscn")


@export var GRID_ROW_AMOUNT = 10
@export var GRID_COL_AMOUNT = 10



var data_matrix : Array = [] 		# matrix of Colors
var sprite_matrix : Array = []		# matrix of Sprite references


# Called when the node enters the scene tree for the first time.
func _ready():
	for row in range(GRID_ROW_AMOUNT):
		data_matrix.append([])
		sprite_matrix.append([])
		for col in range(GRID_COL_AMOUNT):
			var sprite = grid_node_scene.instantiate()
			sprite.set_grid_position(row, col)
			add_child(sprite)
			data_matrix[row].append(Color.WHITE)
			sprite_matrix[row].append(sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func apply_stamp(pos_x, pos_y, stamp_matrix):
	print(pos_x, " ", pos_y)
	for row in range(stamp_matrix.size()):
		for col in range(stamp_matrix[0].size()):
			# Check bounds
			if row + pos_y >= sprite_matrix.size() or col + pos_x >= sprite_matrix[0].size():
				continue 
			
			if stamp_matrix[row][col] != null:
				data_matrix[pos_y+row][pos_x+col] = stamp_matrix[row][col]
				sprite_matrix[pos_y+row][pos_x+col].modulate = stamp_matrix[row][col]

func get_xy_from_global_pos(global_pos: Vector2) -> Vector2:
	var offset = global_pos-position
	return Vector2(int(offset.x/SPRITE_SIZE), int(offset.y/SPRITE_SIZE))
