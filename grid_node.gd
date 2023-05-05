extends Sprite2D


@export var SPRITE_SIZE = 32


func set_grid_position(row, col):
	position = Vector2(col * SPRITE_SIZE, row * SPRITE_SIZE)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
