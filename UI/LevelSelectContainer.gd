extends GridContainer


var button_scene = preload("res://LevelSelectButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1, len(Main.level_names)):
		var button = button_scene.instantiate()
		button.level = i
		add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
