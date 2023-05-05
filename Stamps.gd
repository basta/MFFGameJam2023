extends Node2D

var stamp_scene = preload("res://stamp.tscn")

var stamps = []
var stamps_data = [
	[[Color.RED, Color.WHITE], [Color.RED, Color.WHITE]],
	[[null, null], [null, null]],
]


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(stamps_data.size()):
		var stamp = stamp_scene.instantiate()
		stamp.stamp_matrix = stamps_data[i]
		stamps.append(stamp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass