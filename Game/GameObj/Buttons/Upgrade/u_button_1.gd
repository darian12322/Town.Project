extends Button
class_name Upgrade1_for_first_house

@onready var u_button_1: Button = %UButton1

## Var for the construction path, to get houses variable
var Construction_Path 
var price = 50
var target_node: Node = null
var level = 0
var Bypass : bool = false
var label : Label
var house1sprite: AnimatedSprite2D = null
var house2sprite: AnimatedSprite2D = null

@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

func _ready() -> void:
	
	
	label = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up1/Label")
	if label == null:
		print("Null")
	
	
	
	

func _physics_process(_delta: float) -> void:
	
	## get the animation of the house
	if house1sprite == null:
		house1sprite = get_node_or_null("/root/Game/GameInterface/Houses/WoodHouse/AnimatedSprite2D")
		
			
	## get the animation of the house1
	if house2sprite == null:
		house2sprite = get_node_or_null("/root/Game/GameInterface/Houses/House1/AnimatedSprite2D")
		
			
	
	
	
		## To make the button on if houses == 1
	Construction_Path = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Constructions/ScrollContainer/VBoxContainer/Up1/Button")
	if Construction_Path.houses <= 0 and level == 0:
		%UButton1.disabled = true
## If for checking if you have a house and level to activate the button
	elif level == 0 and Construction_Path.houses >= 1:
		%UButton1.disabled = false
	elif level == 1 and Construction_Path.houses == 1:
		%UButton1.disabled = true
	elif level == 1 and Construction_Path.houses == 2:
		%UButton1.disabled = false
	else:
		%UButton1.disabled = true

## Buy the first upgrade for the first house
func _on_pressed() -> void:
	if level == 0 and Construction_Path.houses == 1 and can_afford() and Bypass == false or Construction_Path.houses == 2 and can_afford() and Bypass == false:
		consume_coins()
		level_up()
		Bypass = true
		price = price * 2
		update_label()
		if house1sprite:
			house1sprite.play("2")
		purchase.play()
		
	elif Bypass == true and Construction_Path.houses == 2 and level == 1 and can_afford():
		consume_coins()
		if house2sprite:
			house2sprite.play("2")
		level_up()
		purchase.play()
## Func for the house to spawn

	
	
	
		
## Func to cosnume coins
func consume_coins() -> void:
	RootNode_Game.ref.data.coins -= price
		
		
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.coins >= price:
		return true
	return false
	
## Level
func level_up() -> void:
	level += 1


## Update the label to the Button
func update_label() -> void:
	label.text = str(price)
