extends RigidBody2D
export var IsPlayer0 = true
export (SpriteFrames) var anims
var health = 50
var water = 50
var food = 50
var stamina = 50
var matches = 5
var IsIdle = true
var IsWalk = false
var IsOnGround = true
var IsFacingRight = true
var alive = true
var id = "Player 1"	
var uiname = "Camera2D/UI_Player0"
var collectable

func _ready():
	if !IsPlayer0:
		id = "Player 2"
		uiname = "Camera2D/UI_Player1"
	get_node("Name").text = id
	get_node("AnimatedSprite").frames = anims
	Update(0, 0, 0, 0)
	
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

func Update(parhealth, parfood, parwater, parmatches):
	health += parhealth
	food += parfood
	matches += parmatches
	water += parwater
	var updatedtext =  "Health: " + str(health) + "%\nWater: " + str(water) + "%\nFood: " + str(food) + "%\nStamina: " + str(stamina) + "%\nMatches: " + str(matches)
	get_parent().get_node(uiname).text = updatedtext

func Interaction(collectable):
	if collectable.name == "Apple":
		Update(10,5,10,0)
		collectable.free()
		return
	if collectable.name == "Axe":
		collectable.free()
		return
	if collectable.name == "Chicken":
		Update(5,20,2,0)
		collectable.free()
		return
	if collectable.name == "Fish":
		Update(10,10,2,0)
		collectable.free()
		return
	if collectable.name == "Meat":
		Update(3,10,1,0)
		collectable.free()
		return
	if collectable.name == "Mineral":
		collectable.free()
		return
	if collectable.name == "Mushroom":
		Update(3,10,4,0)
		collectable.free()
		return
	if collectable.name == "Pickaxe":
		collectable.free()
		return
	if collectable.name == "Shovel":
		collectable.free()
		return
	if collectable.name == "Sword":
		collectable.free()
		return
	if collectable.name == "Wood":
		Update(0,0,0,2)
		collectable.free()
		return

func Interact():
	if $RightRayCast.is_colliding():
		Interaction($RightRayCast.get_collider())
		return
	if $LeftRayCast.is_colliding():
		Interaction($LeftRayCast.get_collider())
		return
