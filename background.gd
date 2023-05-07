extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func resize_background():
	$"../Background".scale = get_viewport().size / 2000.
	$"../Background".position = get_viewport().size / 2
