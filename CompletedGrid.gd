extends Grid

var i;
# Called when the node enters the scene tree for the first time.
func _ready():
	i = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func animate():
	$"../ResponsiveController".resized()
	var timer : Timer = $"AnimationTimer"
	timer.start()

func animate_once():
	if i < len(move_history):
		animate_move(move_history[i])
		i += 1
	else:
		replay()

func animate_move(move):
	for change in move:
		if change[1] != change[2]:
			print_debug("Applying ", change[2], " to ", change[0])
			data_matrix[change[0].x][change[0].y] = change[2]
			sprite_matrix[change[0].x][change[0].y].transition(change[2])

func replay():
	init_grid($"../Grid".GRID_ROW_AMOUNT, $"../Grid".GRID_COL_AMOUNT)
	i = 0

func _on_animation_timer_timeout():
	animate_once()
