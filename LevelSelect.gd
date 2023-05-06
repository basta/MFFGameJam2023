extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
var level_to_load = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func select_level(n):
	var main_scene = load("res://main.tscn")
	get_node("/root/Global").level_to_load = n
	get_tree().change_scene_to_packed(main_scene)
