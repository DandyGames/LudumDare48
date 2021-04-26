extends Node2D
export (PackedScene) var PauseMenu
var PlayerBaseSpeed = 500
export var LevelID = 0
export (AudioStream) var LevelBGM
var canpause = true
var p0_mov = Vector2(0, 0)
var p1_mov = Vector2(0, 0)
var NewCameraPosition = Vector2(0, 0)
var CameraZoom = 0
func _ready():
	get_node("BGM").stream = LevelBGM
	get_node("BGM").play()
	
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
	if p0_mov.length() == 0:
		$Player0.AnimIdle()
	if p1_mov.length() == 0:
		$Player1.AnimIdle()
	p0_mov = Vector2(0, 0)
	p1_mov = Vector2(0, 0)
	$Player0.Ray()
	$Player1.Ray()
	if Input.is_action_pressed("p0_right"):
		p0_mov += Vector2(1, 0)
		$Player0.AnimWalkRight()
	if Input.is_action_pressed("p0_down"):
		$Player0.Interact()
	if Input.is_action_pressed("p0_left"):
		p0_mov += Vector2(-1, 0)
		$Player0.AnimWalkLeft()
	if Input.is_action_pressed("p0_up") and $Player0.IsOnGround:
		p0_mov += Vector2(0, -5)
		$Player0.Jump()
	if Input.is_action_pressed("p1_right"):
		p1_mov += Vector2(1, 0)
		$Player1.AnimWalkRight()
	if Input.is_action_pressed("p1_down"):
		$Player1.Interact()
	if Input.is_action_pressed("p1_left"):
		p1_mov += Vector2(-1, 0)
		$Player1.AnimWalkLeft()
	if Input.is_action_pressed("p1_up") and $Player1.IsOnGround:
		p1_mov += Vector2(0, -5)
		$Player1.Jump()
		
func NextLevel():
	#change level based on the LevelID
	#get_tree().change_scene("res://Scenes/Game/Scene.tscn")
	pass
	
func UpdateCamera():
	NewCameraPosition = ($Player0.position + $Player1.position)/2
	CameraZoom =pow((($Player0.position - $Player1.position)*Vector2(1,5)).length()/1000,1/3)
	#$Camera2D.position = newposition
	get_node("Camera2D").position = NewCameraPosition
	get_node("Camera2D").zoom = Vector2(CameraZoom, CameraZoom)
	
func _process(delta):
	GeneralInput()
	HandlePlayerInput()
	MovPlayers(delta)
	UpdateCamera()
