class_name Buy_First_House
extends Button


@onready var button: Buy_First_House = %Button
@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"




var House = preload("res://Game/GameObj/Houses/WoodHouse/wood_house.tscn")
var target_node: Node = null
var price = 5
var houses : int = 0
var level = 0
var start_Generator : bool = false
var Upgrade_Path
var Bypass : bool = false
var Upgrade1Button: Node = null
var Upgrade4Button: Node = null
@export var timer : Timer


## Get the houses path
func _ready() -> void:
	target_node = get_node("/root/Game/GameInterface/Houses")
	Upgrade1Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up1/UButton1")

	
		
	
		## To make access the Upgrade node
func _physics_process(_delta: float) -> void:
	Upgrade_Path = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up1/UButton1")
	level = Upgrade_Path.level
	
	Upgrade4Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up4/UButton4")

	
	




## On pressed button-build a house
func _on_pressed() -> void:
	if can_afford() and houses == 0 and level == 0 and Bypass == false:
		timer.start()
		houses += 1
		consume_coins()
		inst(Vector2(150,165))
		Bypass = true
		purchase.play()
		
	elif can_afford() and houses == 1 and Bypass == true :
		houses += 1
		consume_coins()
		inst1(Vector2(220,165))
		%Button.disabled = true
		purchase.play()
	
	
## Func for generate more coins  Upgrade is +2 / I can use If housesprite.animation = "2" (for future projects) and
## merge is +50
func generate_coins() -> void:
	
	if Upgrade4Button.level == 0:
		if Upgrade1Button.level == 0 and houses == 1:
			RootNode_Game.ref.data.coins += 1
		elif Upgrade1Button.level == 0 and houses == 2:
			RootNode_Game.ref.data.coins += 2
		elif Upgrade1Button.level == 1 and houses == 1:
			RootNode_Game.ref.data.coins += 3
		elif Upgrade1Button.level == 1 and houses == 2:
			RootNode_Game.ref.data.coins += 4
		elif Upgrade1Button.level == 2:
			RootNode_Game.ref.data.coins += 6
	elif RootNode_Game.ref.data.finished <= 3:
		RootNode_Game.ref.data.coins += 50
		if RootNode_Game.ref.data.finished == 0:
			RootNode_Game.ref.data.finished += 1
	else: 
		RootNode_Game.ref.data.coins += 666
	
## Func for the house to spawn
func inst(pos):
	var instance = House.instantiate()
	var animated_sprite = instance.get_node("AnimatedSprite2D")
	animated_sprite.play("1")
	instance.position = pos
	target_node.add_child(instance)  

func inst1(pos):
	var instance = House.instantiate()
	var animated_sprite = instance.get_node("AnimatedSprite2D")
	animated_sprite.play("1")
	instance.name = "House1"
	instance.position = pos
	target_node.add_child(instance)  
	
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.coins >= price:
		return true
	return false
	
## Func to cosnume coins
func consume_coins() -> void:
	RootNode_Game.ref.data.coins -= price
	
	
		

## Generate money on timer out
func _on_timer_timeout() -> void:
	generate_coins()
