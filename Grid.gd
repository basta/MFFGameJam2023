extends Node2D


@export var GRID_ROW_AMOUNT = 10
@export var GRID_COL_AMOUNT = 10

@export var SPRITE_SIZE = 32


var data_matrix := []
var sprite_matrix := []


# Called when the node enters the scene tree for the first time.
func _ready():
	for row in range(GRID_ROW_AMOUNT):
		data_matrix.append([])
		sprite_matrix.append([])
		for col in range(GRID_COL_AMOUNT):
			var sprite = $"NodeTemplate".duplicate()
			sprite.position = Vector2(col * SPRITE_SIZE, row * SPRITE_SIZE)
			add_child(sprite)
			data_matrix[row].append(0)
			sprite_matrix[row].append(sprite)
	$"NodeTemplate".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(data_matrix)


func apply_stamp(pos_x, pos_y, stamp_matrix):
	for row in range(stamp_matrix.size()):
		for col in range(stamp_matrix[0].size()):
			data_matrix[pos_x+row][pos_y+col] = stamp_matrix[row][col]
		


func do():
	pass

