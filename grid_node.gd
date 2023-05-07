extends Node2D

class_name GridNode

var color: Color = Color(1,1,1,1);\
var shader = preload("res://transition_test.gdshader")
var SoundController: Node
signal on_transition

@export var transition_time: float = 1.

# Called when the node enters the scene tree for the first time.
func _ready():
	$Tile.material = ShaderMaterial.new()
	$Tile.material.shader = shader
	SoundController = get_node("/root/Main/SoundController")
	transition(color, 0, false)
	
var last_delay = 0
func transition(new_color: Color, delay=0, emit=true):
	last_delay = delay
	transition_progress = -delay/transition_time
	$Tile.material.set_shader_parameter("old_color", color)
	$Tile.material.set_shader_parameter("new_color", new_color)
	color = new_color
	did_emit = false
	should_emit = emit
	
var should_emit = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
var transition_progress = 0.
var did_emit = false
func _process(delta):
	if transition_progress > 0 and not did_emit:
		did_emit = true
		if SoundController != null and should_emit:
			SoundController.tile_transitioned()

	$Tile.material.set_shader_parameter("progress", transition_progress)
	transition_progress += delta * 1/transition_time
