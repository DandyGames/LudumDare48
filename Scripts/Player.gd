extends RigidBody2D
export var IsPlayer0 = true
export (SpriteFrames) var anims
export var health = 100
export var water = 100
export var stamina = 100
export var matches = 5
var alive = true
var id = "Player 1"
func _ready():
	if !IsPlayer0:
		id = "Player 2"
	get_node("Name").text = id
	AnimIdleRight()
func AnimIdleRight():
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play('idle')
	
func AnimIdleLeft():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play('idle')
	
func AnimWalkRight():
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play('walkright')
	
func AnimWalkLeft():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play('walkright')
