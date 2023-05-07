extends MarginContainer


func show_stamps():
	$Bottom/HBoxContainer.load_stamp_buttons()


func _on_menu_pressed():
	get_node("/root/Main").to_menu()

func _on_undo_pressed():
	get_node("/root/Main/Grid").undo()


func _on_next_level_pressed():
	get_node("/root/Main").next_level()


func _on_help_pressed():
	$POPUP.visible = true # Replace with function body.
