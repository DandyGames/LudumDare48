extends RigidBody2D
export var IsPlayer0 = true
export (SpriteFrames) var anims
var health = 50
var water = 50
var stamina = 50
var matches = 5
var IsIdle = true
var IsWalk = false
var IsOnGround = true
var IsFacingRight = true
var alive = true
var id = "Player 1"
var collectable

func _ready():
	if !IsPlayer0:
		id = "Player 2"
	get_node("Name").text = id
	get_node("AnimatedSprite").frames = anims
	
func AnimIdle():
	if !IsIdle and IsWalk:
		$AnimatedSprite.flip_h = !IsFacingRight
		$AnimatedSprite.play('idle')
		IsIdle = true
		IsWalk = false
		IsFacingRight = true
	
func AnimWalkRight():
	if !IsWalk and IsIdle:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('walkright')
		IsWalk = true
		IsIdle= false
		IsFacingRight = true
	
func AnimWalkLeft():
	if !IsWalk and IsIdle:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('walkleft')
		IsWalk = true
		IsIdle= false
		IsFacingRight = false

func Jump():
	pass

func Ray():
	IsOnGround = $BottomRayCastL.is_colliding() or $BottomRayCastR.is_colliding()
	if $BottomRayCastL.is_colliding():
		pass

func Interaction(collectable):
		if collectable.name == "Apple":
			print("It's an apple!")
			collectable.free()

func Interact():
	if $RightRayCast.is_colliding():
		Interaction($RightRayCast.get_collider())
	if $LeftRayCast.is_colliding():
		Interaction($LeftRayCast.get_collider())
