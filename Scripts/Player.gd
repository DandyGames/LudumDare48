extends RigidBody2D
export var IsPlayer0 = true
export (SpriteFrames) var anims
export var health = 100
export var water = 100
export var stamina = 100
export var matches = 5
var IsIdle = true
var IsWalk = false
var IsFalling = false
var IsFacingRight = true
var alive = true
var id = "Player 1"
func _ready():
	if !IsPlayer0:
		id = "Player 2"
	get_node("Name").text = id
	AnimIdleRight()
func AnimIdleRight():
	if !IsIdle:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('p1_idle')
		IsIdle = true
		IsWalk = false
		IsFacingRight = true
	
func AnimIdleLeft():
	if !IsIdle:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('p1_idle')
		IsIdle= true
		IsWalk = false
		IsFacingRight = false
	
func AnimWalkRight():
	if !IsWalk:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('p1_walkright')
		IsWalk = true
		IsIdle= false
		IsFacingRight = true
	
func AnimWalkLeft():
	if !IsWalk:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('p1_walkleft')
		IsWalk = true
		IsIdle= false
		IsFacingRight = false
