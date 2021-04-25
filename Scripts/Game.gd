extends Control
export (PackedScene) var PauseMenu
export var PlayerBaseSpeed = 60
export var LevelID = 0
export (AudioStream) var LevelBGM
var canpause = true
var p0_mov = Vector2(0, 0)
var p1_mov = Vector2(0, 0)
func _ready():
	get_node("BGM").stream = LevelBGM
	get_node("BGM").play()
	pass
	
func GeneralInput():
	if Input.is_action_pressed("ui_cancel") and canpause:
		canpause = false
		var pausemenu = PauseMenu.instance()
		get_node("HUD").add_child(pausemenu)
	
func MovPlayers(delta):
	var speed = delta*PlayerBaseSpeed
	get_node("Player0").apply_impulse(Vector2(0,0),p0_mov*speed)#move_and_collide(p0_mov*speed)
	get_node("Player1").apply_impulse(Vector2(0,0),p1_mov*speed)#move_and_collide(p1_mov*speed)
	
func HandlePlayerInput():
	p0_mov = Vector2(0, 0)
	p1_mov = Vector2(0, 0)
	if Input.is_action_pressed("p0_right"):
		p0_mov += Vector2(1, 0)
		$Player0.AnimWalkRight()
	#if Input.is_action_pressed("p0_down"):
	#	p0_mov += Vector2(0, 1)
	if Input.is_action_pressed("p0_left"):
		p0_mov += Vector2(-1, 0)
		$Player0.AnimWalkLeft()
	if Input.is_action_pressed("p0_up"):
		p0_mov += Vector2(0, -5)
	if Input.is_action_pressed("p1_right"):
		p1_mov += Vector2(1, 0)
		$Player1.AnimWalkRight()
	#if Input.is_action_pressed("p1_down"):
	#	p1_mov += Vector2(0, 1)
	if Input.is_action_pressed("p1_left"):
		p1_mov += Vector2(-1, 0)
		$Player1.AnimWalkLeft()
	if Input.is_action_pressed("p1_up"):
		p1_mov += Vector2(0, -5)
		
func NextLevel():
	#change level based on the LevelID
	#get_tree().change_scene("res://Scenes/Game/Scene.tscn")
	pass
	
func UpdateCamera():
	var newposition = ($Player0.position + $Player0.position)/2
	$Node2D.position = newposition
	
func _process(delta):
	GeneralInput()
	HandlePlayerInput()
	MovPlayers(delta)
	UpdateCamera()
