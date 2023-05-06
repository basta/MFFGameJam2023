extends Node2D


var BASE_SCALE: float

@export var SIZE_X: int
@export var SIZE_Y: int


# Called when the node enters the scene tree for the first time.
func _ready():
	BASE_SCALE = float(Global.SPRITE_SIZE) / Global.SPRITE_TEXTURE_SIZE
	print_debug(BASE_SCALE)
	print_debug(Global.SPRITE_SIZE , Global.SPRITE_TEXTURE_SIZE)
	scale.x = BASE_SCALE
	scale.y = BASE_SCALE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_size(rows, cols):
	SIZE_X = cols
	SIZE_Y = rows
	scale.x = BASE_SCALE * cols
	scale.y = BASE_SCALE * rows


func disable():
	visible = false


func is_valid(row: int, col: int, max_row: int, max_col: int) -> bool:
	return row <= max_row - SIZE_X && col <= max_col - SIZE_X
