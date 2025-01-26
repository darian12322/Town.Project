extends Button
class_name Upgrade1_for_third_house


@onready var u_button_3: Upgrade1_for_third_house = %UButton3
@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"



var price = 500
var level = 0
var label : Label
var Church_house1sprite: AnimatedSprite2D = null





func _ready() -> void:
	pass # Replace with function body.






func _process(_delta: float) -> void:
	if Church_house1sprite == null:
		Church_house1sprite = get_node_or_null("/root/Game/GameInterface/Houses/Church/AnimatedSprite2D")
	if Church_house1sprite != null:	
		if Church_house1sprite.animation == "1":
			%UButton3.disabled = false
		elif Church_house1sprite.animation == "2":
			%UButton3.disabled = true
		else:
			%UButton3.disabled = true
	else:
		%UButton3.disabled = true
	
func _on_pressed() -> void:
	if can_afford() and level == 0:
		consume_coins()
		level_up()
		if Church_house1sprite:
			Church_house1sprite.play("2")
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
