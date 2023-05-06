extends Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func init_level(matrix):
	data_matrix = matrix
	for row in range(GRID_ROW_AMOUNT):
		for col in range(GRID_COL_AMOUNT):
			sprite_matrix[row][col].transition(data_matrix[row][col])
