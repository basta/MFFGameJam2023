extends HBoxContainer


var button_scene = preload("res://UI/stamp_button.tscn")


func _ready():
	reset_selection()


func reset_selection():
	for node in get_children():
		node.selected = false
		node.modulate = Color("ffffff", 0.6)


# Called when the node enters the scene tree for the first time.
func load_stamp_buttons():
	var stamps_ctr = get_node("/root/Main/Stamps")
	for stamp in stamps_ctr.get_children():
		var grid: GridContainer = stamp.generate_ui_node()
		var button_ctr: StampButtonContainer = button_scene.instantiate()
		add_child(button_ctr)
		button_ctr.add_stamp_ui(grid)
		button_ctr.stamp = stamp
		stamps_ctr.stamp_buttons.append(button_ctr)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
