extends Node2D

class_name Stamps


var stamp_scene = preload("res://stamp.tscn")

var current_stamp: Stamp

var stamps = []
var stamp_buttons = []
var stamps_data


func create_stamps():
	for i in range(stamps_data.size()):
		var stamp = stamp_scene.instantiate()
		stamp.set_matrix(stamps_data[i])
		stamps.append(stamp)
		add_child(stamp)



func get_offset_idx(offset: int) -> int:
	# assert current_stamp
	var next_idx = stamps.find(current_stamp) + offset
	if next_idx < 0: return stamps.size()-1
	elif next_idx == stamps.size(): return 0
	else: return next_idx


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("next_stamp") && current_stamp:
		print("NEXT ", get_offset_idx(1))
		stamp_buttons[get_offset_idx(1)].clicked()
	if event.is_action_pressed("previous_stamp") && current_stamp:
		print("PREV ", get_offset_idx(-1))
		stamp_buttons[get_offset_idx(-1)].clicked()
