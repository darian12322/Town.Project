class_name Buy_Third_House
extends Button

@onready var button_2: Button = %Button2
@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

var House = preload("res://Game/GameObj/Houses/Church/church.tscn")
var target_node: Node = null
var price = 100
var level : int = 0
var houses : int = 0
var start_Generator : bool = false
var label1 : Label
var Upgrade3Button: Node = null
var Upgrade6Button: Node = null

@export var timer : Timer

## Get the Brick_houses path and label path

func _ready() -> void:
	target_node = get_node("/root/Game/GameInterface/Houses")
	
	label1 = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Constructions/ScrollContainer/VBoxContainer/Up3/Label2")
	if label1 == null:
		print("Null")
	Upgrade6Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up6")

func _physics_process(_delta: float) -> void:
	if Upgrade3Button == null:
		Upgrade3Button = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up3/UButton3")




## On pressed button-build a house
func _on_pressed() -> void:
	if can_afford() and houses == 0:
		timer.start()
		houses += 1
		consume_coins()
		inst(Vector2(260,80))
		%Button2.disabled = true
		purchase.play()

## Func for generate more coins Upgrade is +40 merge is 150
func generate_coins() -> void:
	if Upgrade6Button.level == 0:
		if houses == 1 and Upgrade3Button.level == 0:
			RootNode_Game.ref.data.coins += 10
		elif houses == 1 and Upgrade3Button.level == 1:
			RootNode_Game.ref.data.coins += 50
	elif RootNode_Game.ref.data.finished <= 3:
		RootNode_Game.ref.data.coins += 150
		if RootNode_Game.ref.data.finished == 2:
			RootNode_Game.ref.data.finished += 1
	else:
		RootNode_Game.ref.data.coins += 0
	
	
	
## Func for the house to spawn
func inst(pos):
	var instance = House.instantiate()
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
	print("a consumat")
## Level
func level_up() -> void:
	level += 1
		

## Generate money on timer out
func _on_timer_2_timeout() -> void:
	generate_coins()
	
## Update the label to the Button
func update_label() -> void:
	label1.text = str(price)


func _on_timer_timeout() -> void:
	generate_coins()
