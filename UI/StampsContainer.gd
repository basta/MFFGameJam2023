extends VBoxContainer
var button_scene = preload("res://UI/stamp_UI.tscn")

func reset_selection():
	for node in get_children():
		node.get_node("TextureButton").selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var stamps_ctr = get_node("/root/Main/Stamps")
	for stamp in stamps_ctr.get_children():
		var grid : GridContainer = stamp.generate_ui_node()
		var button = button_scene.instantiate()
		add_child(button)
		button.add_child(grid)
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
