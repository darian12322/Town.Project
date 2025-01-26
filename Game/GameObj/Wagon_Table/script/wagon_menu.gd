extends Control
class_name Wagon_Script
@onready var wagon_menu: Control = $"."
@onready var button: Button = %Button
@onready var button_2: Button = %Button2


var price = 100
var gprice = 5000
var Item_Bought: int = 0
var Item_BoughtBypass: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
	
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_afford() and Item_BoughtBypass == false:
		button.disabled = false
		
	else:
		button.disabled = true
		
	
	if can_afford2() and Item_BoughtBypass == false:
		button_2.disabled = false
	else:
		button_2.disabled = true
func _on_quit_pressed() -> void:
	$".".queue_free()

## Func to consume coins
func _on_button_pressed() -> void:
	if can_afford():
		Item_BoughtBypass = true
		consume_coins()
		RootNode_Game.ref.data.red_crystal += 1
		Item_Bought += 1
		
func _on_button_2_pressed() -> void:
	if can_afford():
		Item_BoughtBypass = true
		consume_coins2()
		RootNode_Game.ref.data.green_crystal += 1
		Item_Bought += 1	


## Func to consume coins
func consume_coins() -> void:
	RootNode_Game.ref.data.coins -= price

func consume_coins2() -> void:
	RootNode_Game.ref.data.coins -= gprice



## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.coins >= price:
		return true
	return false

func can_afford2() -> bool:
	if RootNode_Game.ref.data.coins >= gprice:
		return true
	return false
