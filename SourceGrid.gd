extends Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


func display_level(matrix):
	data_matrix = matrix
	for row in range(GRID_ROW_AMOUNT):
		for col in range(GRID_COL_AMOUNT):
			sprite_matrix[row][col].modulate = data_matrix[row][col]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
