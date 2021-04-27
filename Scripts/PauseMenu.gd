extends Control
func _ready():
	if OS.get_name() == "HTML5":
		get_node("GridContainer/ButtonQuit").hide()
func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")

func _on_ButtonQuit_pressed():
	get_tree().quit()

func _on_ButtonResume_pressed():
	get_parent().get_parent().canpause = true
	self.queue_free()


func _on_Control_pressed():
	get_tree().change_scene("res://Scenes/Game/Level0.tscn")
