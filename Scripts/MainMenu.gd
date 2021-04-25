extends Control
func _ready():
	#String get_name() const
	#Return the name of the host OS. Possible values are: "Android", "BlackBerry 10", "Flash", "Haiku", "iOS", "HTML5", "OSX", "Server", "Windows", "WinRT", "X11"
	if OS.get_name() == "HTML5":
		get_node("MenuGrid/ButtonQuit").hide()
	#OS.set_window_title("You are a pirate!")
func _on_ButtonStart_pressed():
	get_tree().change_scene("res://Scenes/Game/Level0.tscn")

func _on_ButtonOptions_pressed():
	get_tree().change_scene("res://Scenes/Menu/Options.tscn")

func _on_ButtonAbout_pressed():
	get_tree().change_scene("res://Scenes/Menu/AboutUs.tscn")

func _on_ButtonQuit_pressed():
	get_tree().quit()
