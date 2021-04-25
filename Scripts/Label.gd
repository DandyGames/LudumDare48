extends Label
export (Font) var customfont

func _ready():
	if customfont != null:
		self.add_font_override("font",customfont)
	self.set_position(Vector2(self.rect_size.x/-2, 0))
