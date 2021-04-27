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
var uiname = "View/UI_Player0"
var collectable

func _ready():
	if !IsPlayer0:
		id = "Player 2"
		uiname = "View/UI_Player1"
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
	if !IsOnGround:
		self.gravity_scale = 15
	else:
		self.gravity_scale = 0.25

func Update(parhealth, parwater, parfood, parmatches):
	health += parhealth
	if food+parfood < 0:
		food = 0
		health += parfood
	else:
		food += parfood
	if water+parwater < 0:
		water = 0
		health += parwater
	else:
		water += parwater		
	matches += parmatches
	var updatedtext =  "Health: " + str(int(health)) + "%\nWater: " + str(int(water)) + "%\nFood: " + str(int(food)) + "%\nMatches: " + str(matches)
	get_parent().get_node(uiname).text = updatedtext

func Interaction(collectable):
	if collectable != null:
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
		if collectable.name == "Water":
			Update(0,15,0,0)
			collectable.free()
			return
		if collectable.name == "Next":
			get_tree().change_scene("res://Scenes/Game/Level1.tscn")
			return
		if collectable.name == "End":
			get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")
			return

func Interact():
	if $RightRayCast.is_colliding():
		Interaction($RightRayCast.get_collider())
	if $LeftRayCast.is_colliding():
		Interaction($LeftRayCast.get_collider())
