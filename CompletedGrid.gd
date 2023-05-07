extends Grid

var i;
var paused;
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
	$HSlider.max_value = len(move_history)

func animate_once():
	if not paused:
		$HSlider.value = i
		if i < len(move_history):
			animate_move(move_history[i])
			i += 1

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

func animate_until(n):
	while n > i:
		animate_once()


func _on_h_slider_drag_ended(value_changed):
	paused = false
	if value_changed:
		replay()
		animate_until($HSlider.value)



func _on_h_slider_drag_started():
	paused = true
