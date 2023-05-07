extends Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func animate():
	$"../ResponsiveController".resized()
	print_debug("CONGRATS!")
	for move in move_history:
		for change in move:
			sprite_matrix[change[0].x][change[0].y].transition(change[2])
		await get_tree().create_timer(.4).timeout
