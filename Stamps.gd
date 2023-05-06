extends Node2D

var stamp_scene = preload("res://stamp.tscn")

var stamps = []
var stamps_data = [
	[[Color.RED, Color.WHITE], [Color.RED, Color.WHITE]],
	[[Color.RED, Color.WHITE], [Color.WHITE, Color.RED, ]],
	[[Color.WHITE, Color.WHITE], [Color.WHITE, Color.WHITE, ]],
	[[null, null], [null, null]],
]


# Called when the node enters the scene tree for the first time.
func create_stamps():
	for i in range(stamps_data.size()):
		var stamp = stamp_scene.instantiate()
		stamp.set_matrix(stamps_data[i])
		stamps.append(stamp)
		add_child(stamp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
