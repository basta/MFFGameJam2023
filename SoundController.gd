extends Node


const TRANSITION_PLAYERS_N = 50
var transition_players = []
var transition_players_states: Array[bool] = []
var transition_scene = preload("res://transition.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in TRANSITION_PLAYERS_N:
		var scene = transition_scene.instantiate()
		transition_players.append(scene)
		add_child(scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func tile_transitioned():
	for t_player in transition_players:
		if not t_player.playing:
			t_player.pitch_scale = 1 + randf_range(-0.1, 0.5)
			t_player.play()
			break

func _on_main_level_loaded():
	print("loaded")
