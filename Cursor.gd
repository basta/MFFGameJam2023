extends Node2D


var BASE_SCALE: float

@export var SIZE_X: int
@export var SIZE_Y: int


var cursor_texture = load("res://sprites/cursor.svg")
var cursor_err_texture = load("res://sprites/cursor_err.svg")


# Called when the node enters the scene tree for the first time.
func _ready():
	var main_node = get_node("/root/Main")
	BASE_SCALE = float(main_node.SPRITE_SIZE) / main_node.SPRITE_TEXTURE_SIZE
	scale.x = BASE_SCALE
	scale.y = BASE_SCALE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_size(rows, cols) -> void:
	var main_node = get_node("/root/Main")
	var i = 0
	for child in get_children():
		if i > 0:
			child.queue_free()
		i = 1
	SIZE_X = cols
	SIZE_Y = rows
	var source_child = get_child(0)
	for row in range(SIZE_Y):
		for col in range(SIZE_X):
			if row == 0 && col == 0:
				continue
			var child = source_child.duplicate()
			# child.scale.x = BASE_SCALE * cols
			# child.scale.y = BASE_SCALE * rows
			child.position = Vector2(col * main_node.SPRITE_TEXTURE_SIZE, row * main_node.SPRITE_TEXTURE_SIZE)
			add_child(child)


func disable() -> void:
	visible = false


func show_err(index_pos: Vector2, max_pos: Vector2) -> void:
	var i = 0
	for child in get_children():
		var row = int(i / SIZE_X)
		var col = i % SIZE_X
		if row >= -index_pos.y && col >= -index_pos.x && row+index_pos.y < max_pos.y && col+index_pos.x < max_pos.x:
			child.visible = true
		else:
			child.visible = false
		print_debug(row, " ", col, " ", i)
		print_debug(index_pos)
		child.texture = cursor_err_texture
		i += 1


func enable() -> void:
	for child in get_children():
		child.texture = cursor_texture
		child.visible = true
	visible = true


