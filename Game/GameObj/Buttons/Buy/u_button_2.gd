extends Button
class_name Upgrade1_for_second_house

@onready var u_button_2: Button = %UButton2
@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

 
var price = 120
var level = 0
var label : Label
var Brick_house1sprite: AnimatedSprite2D = null
var Brick_house2sprite: AnimatedSprite2D = null
func _ready() -> void:
	label = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Upgrades/ScrollContainer2/VBoxContainer/Up2/Label")
	



func _process(_delta: float) -> void:
	if Brick_house1sprite == null:
		Brick_house1sprite = get_node_or_null("/root/Game/GameInterface/Houses/Brick_House/Sprite2D")
	if Brick_house2sprite == null:
		Brick_house2sprite = get_node_or_null("/root/Game/GameInterface/Houses/HouseB1/Sprite2D")
	


	if Brick_house1sprite != null and Brick_house1sprite.animation == "1":
		%UButton2.disabled = false
		
	elif Brick_house2sprite != null and Brick_house2sprite.animation == "1":
		%UButton2.disabled = false
		
	else:
		%UButton2.disabled = true
		
	
func _on_pressed() -> void:
	if can_afford() and level == 0:
		consume_coins()
		price = price * 2
		level_up()
		update_label()
		if Brick_house1sprite:
			Brick_house1sprite.play("2")
		purchase.play()
	elif can_afford() and level == 1:
		consume_coins()
		level_up()
		if Brick_house2sprite:
			Brick_house2sprite.play("2")
		purchase.play()
	

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
