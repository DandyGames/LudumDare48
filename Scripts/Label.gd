extends Label
export (Font) var customfont
export (Vector2) var offset
export var reposition = true
func _ready():
	if customfont != null:
		self.add_font_override("font",customfont)
	if reposition:
		self.set_position(Vector2(self.rect_size.x/-2, 0)+offset)
