extends Control
export (PackedScene) var PauseMenu
export var PlayerBaseSpeed = 100
var canpause = true
var p0_mov = Vector2(0, 0)
var p1_mov = Vector2(0, 0)
func _ready():
	pass
	
func GeneralInput():
	if Input.is_action_pressed("ui_cancel") and canpause:
		canpause = false
		var pausemenu = PauseMenu.instance()
		get_node("Interface").add_child(pausemenu)
	
func MovPlayers():
	var speed = get_process_delta_time()*PlayerBaseSpeed
	#get_node("Player0").position += p0_mov*speed
	#get_node("Player1").position += p1_mov*speed
	get_node("Player0").move_and_collide(p0_mov*speed)
	get_node("Player1").move_and_collide(p1_mov*speed)
	
func HandlePlayerMov():
	p0_mov = Vector2(0, 0)
	p1_mov = Vector2(0, 0)
	if Input.is_action_pressed("p0_right"):
		p0_mov += Vector2(1, 0)
	if Input.is_action_pressed("p0_down"):
		p0_mov += Vector2(0, 1)
	if Input.is_action_pressed("p0_left"):
		p0_mov += Vector2(-1, 0)
	if Input.is_action_pressed("p0_up"):
		p0_mov += Vector2(0, -1)
	if Input.is_action_pressed("p1_right"):
		p1_mov += Vector2(1, 0)
	if Input.is_action_pressed("p1_down"):
		p1_mov += Vector2(0, 1)
	if Input.is_action_pressed("p1_left"):
		p1_mov += Vector2(-1, 0)
	if Input.is_action_pressed("p1_up"):
		p1_mov += Vector2(0, -1)
		
func _process(delta):
	GeneralInput()
	HandlePlayerMov()
	MovPlayers()
