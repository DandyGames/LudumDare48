extends RigidBody2D
export var IsPlayer0 = true
var id = "Player 1"
func _ready():
	if !IsPlayer0:
		id = "Player 2"
	get_node("Name").text = id
