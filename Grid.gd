extends Node2D

class_name Grid

var grid_node_scene = preload("res://grid_node.tscn")


var GRID_ROW_AMOUNT = 0
var GRID_COL_AMOUNT = 0

var SPRITE_SIZE

var data_matrix : Array = [] 		# matrix of Colors
var sprite_matrix : Array = []		# matrix of Sprite references

var cursor: Node2D

var move_history: Array[Array] = []
# [
#  ...
#  [[vec1, old_color, new_color], [vec2, old_color, new_color]...], # Move before last
#  [[vec1, old_color, new_color], [vec2, old_color, new_color]...], # Last move
# ]


# Called when the node enters the scene tree for the first time.
func _ready():
	cursor = $"Cursor"
	cursor.disable()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("undo"):
		undo()


func init_grid(rows, cols):
	GRID_ROW_AMOUNT = rows
	GRID_COL_AMOUNT =  cols
	# TODO: free all nodes when reseting level
	# for i in get_children():
	# 	queue_free()
	data_matrix = []
	sprite_matrix = []
	for row in range(GRID_ROW_AMOUNT):
		data_matrix.append([])
		sprite_matrix.append([])
		for col in range(GRID_COL_AMOUNT):
			var sprite = grid_node_scene.instantiate()
			set_grid_position(row, col, sprite)
			add_child(sprite)
			data_matrix[row].append(Color.WHITE)
			sprite_matrix[row].append(sprite)


func set_grid_position(row, col, object):
	var main_node = get_node("/root/Main")
	object.position = Vector2(col * main_node.SPRITE_SIZE, row * main_node.SPRITE_SIZE)

const HALF_CYAN = Color("#80ffff")
const HALF_MAGENTA = Color("#ff80ff")
const HALF_YELLOW = Color("#ffff80")
const MIXING = {
	HALF_CYAN: {
		HALF_CYAN: Color("#00ffff"),
		HALF_MAGENTA: Color("#0000ff"),
		HALF_YELLOW: Color("#00ff00"),
	},
	HALF_MAGENTA: {
		HALF_CYAN: Color("#0000ff"),
		HALF_MAGENTA: Color("#ff00ff"),
		HALF_YELLOW: Color("#ff0000"),
	},
	HALF_YELLOW: {
		HALF_CYAN: Color("#00ff00"),
		HALF_MAGENTA: Color("#ff0000"),
		HALF_YELLOW: Color("#ffff00"),
	},
}

func apply_stamp(pos_x, pos_y, stamp_matrix, history=true, is_undoing=false) -> void:
	var move = [] # for logging for undo
	for row in range(stamp_matrix.size()):
		for col in range(stamp_matrix[0].size()):
			if row + pos_y >= GRID_ROW_AMOUNT or col + pos_x >= GRID_COL_AMOUNT:
				continue 
			if stamp_matrix[row][col].a == 0:
				continue
			var current_color = data_matrix[pos_y+row][pos_x+col]
			var new_color = stamp_matrix[row][col]
			if not is_undoing:
				if current_color != Color("#ffffff") and MIXING.has(new_color):
					if MIXING[new_color].has(current_color):
						new_color = MIXING[new_color][current_color]
					else:
						continue
			move.append([
				Vector2(pos_y+row, pos_x+col),
				sprite_matrix[pos_y+row][pos_x+col].color,
				new_color])
			data_matrix[pos_y+row][pos_x+col] = new_color
			sprite_matrix[pos_y+row][pos_x+col].transition(new_color)
	if history:
		move_history.append(move)


func get_xy_from_global_pos(global_pos: Vector2) -> Vector2:
	var main_node = get_node("/root/Main")
	var offset = global_pos - position
	return Vector2(int(offset.x / main_node.SPRITE_SIZE), int(offset.y / main_node.SPRITE_SIZE))


func is_cursor_valid(index_pos: Vector2) -> bool:
	return 0 <= index_pos.y && index_pos.y <= GRID_ROW_AMOUNT - cursor.SIZE_Y && 0 <= index_pos.x && index_pos.x <= GRID_COL_AMOUNT - cursor.SIZE_X


func place_cursor(index_pos: Vector2) -> void:
	if is_cursor_valid(index_pos):
		cursor.enable()
		set_grid_position(index_pos.y, index_pos.x, cursor)
	else:
		cursor.disable()


func undo():
	var last_move = move_history.pop_back()
	if last_move:
		for change in last_move:
			apply_stamp(change[0].y, change[0].x, [[change[1]]], false, true)

