extends Node2D
export var CustomName = ""
export (Texture) var CollectableTexture
func _ready():
	$StaticBody2D/Sprite.texture = CollectableTexture
	$StaticBody2D.name = CustomName
