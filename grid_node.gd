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
	transition(color)
	
func transition(new_color: Color):
	transition_progress = 0
	$Tile.material.set_shader_parameter("old_color", color)
	$Tile.material.set_shader_parameter("new_color", new_color)
	color = new_color
	SoundController.tile_transitioned()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
var transition_progress = 0.
func _process(delta):
	$Tile.material.set_shader_parameter("progress", transition_progress)
	transition_progress += delta * 1/transition_time
