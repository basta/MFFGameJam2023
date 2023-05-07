extends TextureButton

var level = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_node("/root/LevelSelect").select_level(level)
