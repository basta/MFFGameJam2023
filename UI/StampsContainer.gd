extends VBoxContainer
var button_scene = preload("res://UI/stamp_button.tscn")

func reset_selection():
	for node in get_children():
		node.selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var stamps_ctr = get_node("/root/Main/Stamps")
	for stamp in stamps_ctr.get_children():
		var grid : GridContainer = stamp.generate_ui_node()
		var button_ctr: StampButtonContainer = button_scene.instantiate()
		add_child(button_ctr)
		button_ctr.add_stamp_ui(grid)
		button_ctr.stamp = stamp
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
