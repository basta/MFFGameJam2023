extends Node

class_name LevelLoader

const COLORS = {
	"B": Color("#000000"),
	"C": Color("#00ffff"),
	"G": Color("#808080"),
	"L": Color("#00ff00"),
	"M": Color("#ff00ff"),
	"O": Color("#ff8000"),
	"R": Color("#ff0000"),
	"W": Color("#ffffff"),
	"Y": Color("#ffff00"),
	"b": Color("#0000ff"),
	"c": Color("#80ffff"),
	"g": Color("#008000"),
	"m": Color("#ff80ff"),
	"y": Color("#ffff80"),
}

static func parse_stamp(text: String) -> Array:
	var lines = Array(text.split("\n"))
	var width = lines.map(func(line): return line.length()).max() / 2
	return lines.map(func(line):
		var row = []
		for i in line.length() / 2:
			var command = line[2 * i]
			var argument = line[2 * i + 1]
			if command == " ":
				row.append(Color.TRANSPARENT)
			elif command == "+":
				row.append(COLORS[argument])
		while row.size() < width:
			row.append(Color.TRANSPARENT)
		return row
	)

static func load_level(level_name: String):
	
	var img_texture = load("levels/" + level_name + ".png")
	
	var image: Image = img_texture.get_image() # You can delete this line
	var width = image.get_width()
	var height = image.get_height()
	var grid = []
	for y in height:
		var row = []
		for x in width:
			row.append(image.get_pixel(x, y))
		grid.append(row)
	var stamps_file = FileAccess.open("res://levels/" + level_name + ".stamps", FileAccess.READ)
	var stamps = []
	for stamp_text in stamps_file.get_as_text().strip_edges(false, true).split("\n---\n"):
		stamps.append(parse_stamp(stamp_text))
	# grid nad stamps is row, col
	return [grid, stamps]
