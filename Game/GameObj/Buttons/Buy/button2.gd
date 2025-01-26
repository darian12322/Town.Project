class_name Buy_second_house
extends Button

@onready var button_1: Button = %Button1
@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

var House = preload("res://Game/GameObj/Houses/BrickHouse/brick_house.tscn")
var target_node: Node = null
var price = 20
var level2 : int = 0
var houses2 : int = 0
var start_Generator : bool = false
var label1 : Label
var Upgrade2Button: Node = null
var Upgrade4Button: Node = null
@export var timer : Timer

## Get the Brick_houses path and label path

func _ready() -> void:
	target_node = get_node("/root/Game/GameInterface/Houses")
	
	label1 = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Constructions/ScrollContainer/VBoxContainer/Up2/Label1")
	if label1 == null:
		print("Null")
		

func _physics_process(_delta: float) -> void:
	Upgrade2Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up2/UButton2")
	Upgrade4Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up5/UButton5")

## On pressed button-build a house
func _on_pressed() -> void:
	if can_afford() and houses2 == 0:
		timer.start()
		houses2 += 1
		consume_coins()
		inst(Vector2(370,115))
		price = price * 2
		update_label()
		purchase.play()
		
	elif can_afford() and houses2 == 1:
		houses2 += 1
		consume_coins()
		inst1(Vector2(445,115))
		%Button1.disabled = true
		purchase.play()
## Func for generate more coins upgrade is +6 merge is 100
func generate_coins() -> void:
	if Upgrade4Button.level == 0:
		if Upgrade2Button.level == 0 and houses2 == 1:
			RootNode_Game.ref.data.coins += 2
		elif Upgrade2Button.level == 0 and houses2 == 2:
			RootNode_Game.ref.data.coins += 4
		elif Upgrade2Button.level == 1 and houses2 == 1:
			RootNode_Game.ref.data.coins += 8
		elif Upgrade2Button.level == 1 and houses2 == 2:
			RootNode_Game.ref.data.coins += 10
		elif Upgrade2Button.level == 2:
			RootNode_Game.ref.data.coins += 16
	elif RootNode_Game.ref.data.finished <= 3:
		RootNode_Game.ref.data.coins += 100
		if RootNode_Game.ref.data.finished == 1:
			RootNode_Game.ref.data.finished += 1
	else:
		RootNode_Game.ref.data.coins += 0




	

	
	
	
	
## Func for the house to spawn
func inst(pos):
	var instance = House.instantiate()
	instance.position = pos
	target_node.add_child(instance)  
	
func inst1(pos):
	var instance = House.instantiate()
	var animated_sprite = instance.get_node("Sprite2D")
	animated_sprite.play("1")
	instance.name = "HouseB1"
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
## Level
func level_up() -> void:
	level2 += 1
		

## Generate money on timer out
func _on_timer_timeout() -> void:
	generate_coins()
	
## Update the label to the Button
func update_label() -> void:
	label1.text = str(price)
