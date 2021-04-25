extends Control
export (PackedScene) var PauseMenu
var canpause = true
func _ready():
	pass 
func _process(delta):
	
	if Input.is_action_pressed("ui_cancel") and canpause:
		canpause = false
		var pausemenu = PauseMenu.instance()
		get_node("Interface").add_child(pausemenu)
