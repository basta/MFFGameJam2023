extends Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var delay = 0.01
func init_level(matrix):
	var ctr = 0
	data_matrix = matrix
	for row in range(GRID_ROW_AMOUNT):
		for col in range(GRID_COL_AMOUNT):
			var should_emit =  data_matrix[row][col] != Color.WHITE
			sprite_matrix[row][col].transition(data_matrix[row][col], ctr*delay, should_emit)
			ctr += 1
