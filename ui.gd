extends MarginContainer


func show_stamps():
	$Bottom/HBoxContainer.load_stamp_buttons()


func _on_menu_pressed():
	get_node("/root/Main").to_menu()

func _on_undo_pressed():
	get_node("/root/Main/Grid").undo()
