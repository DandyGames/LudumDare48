extends Control
func _on_ButtonStart_pressed():
	get_tree().change_scene("res://Scenes/Game/Game.tscn")

func _on_ButtonOptions_pressed():
	get_tree().change_scene("res://Scenes/Menu/Options.tscn")

func _on_ButtonAbout_pressed():
	get_tree().change_scene("res://Scenes/Menu/AboutUs.tscn")

func _on_ButtonQuit_pressed():
	get_tree().quit()
