extends Node2D

var grid_node_scene = preload("res://grid_node.tscn")


@export var SIZE_X := 3
@export var SIZE_Y := 3

@export var SPRITE_SIZE = 32

var stamp_matrix : Array = []		# array of Colors


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generate_ui_node():
	var node = Node2D.new()
	for row in range(stamp_matrix.size()):
		for col in range(stamp_matrix[0].size()):
			if stamp_matrix[row][col] != null:
				var sprite = grid_node_scene.instantiate()
				sprite.position = Vector2(col * SPRITE_SIZE, row * SPRITE_SIZE)
				sprite.position = Vector2(col * SPRITE_SIZE, row * SPRITE_SIZE)
				node.add_child(sprite)
	
