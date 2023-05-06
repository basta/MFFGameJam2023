extends Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	print("GRID")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func animate():
	print_debug("CONGRATS!")
	for move in move_history:
		for change in move:
			print_debug(change)
			sprite_matrix[change[0].y][change[0].x].transition(change[2])
			await get_tree().create_timer(.25).timeout
