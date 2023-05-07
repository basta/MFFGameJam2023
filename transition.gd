extends AudioStreamPlayer2D


func play_multiple( from_position=0.0 ):
	if !playing:
		play(from_position)
	else:
		var asp = self.duplicate()
		get_parent().add_child(asp)
		asp.stream = stream
		asp.play()
		await asp
		asp.queue_free()
		
