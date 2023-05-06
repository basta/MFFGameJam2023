extends Node

class_name LevelLoader

const COLORS = {
	"C": Color("#00ffff"),
	"G": Color("#008000"),
	"O": Color("#ff8000"),
	"R": Color("#ff0000"),
	"Y": Color("#ffff00"),
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
				row.append(Color(0, 0, 0, 0))
			elif command == "+":
				row.append(COLORS[argument])
		while row.size() < width:
			row.append(Color(0, 0, 0, 0))
		return row
	)

static func load_level(level_name: String):
	var image = Image.load_from_file("levels/" + level_name + ".png")
	var width = image.get_width()
	var height = image.get_height()
	var grid = []
	for y in height:
		var row = []
		for x in width:
			row.append(image.get_pixel(x, y))
		grid.append(row)
	var stamps_file = FileAccess.open("levels/" + level_name + ".stamps", FileAccess.READ)
	var stamps = []
	for stamp_text in stamps_file.get_as_text().strip_edges(left=false).split("\n---\n"):
		stamps.append(parse_stamp(stamp_text))
	# grid nad stamps is row, col
	return [grid, stamps]
