extends Control
func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")

func _on_ButtonQuit_pressed():
	get_tree().quit()

func _on_ButtonResume_pressed():
	get_parent().queue_free()
