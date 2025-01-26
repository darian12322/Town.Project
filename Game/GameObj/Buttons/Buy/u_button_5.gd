extends Button
class_name Upgrade2_for_second_house

@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

var price = 2
var level = 0
var House_SpriteAn: AnimatedSprite2D = null
var House_SpriteAn2: AnimatedSprite2D = null
var House_Sprite: Node = null
var House_Sprite2: Node = null
@onready var u_button_5: Upgrade2_for_second_house = %UButton5


func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	if House_SpriteAn and House_SpriteAn.animation == "2" and House_SpriteAn2 and House_SpriteAn2.animation == "2":
		if can_afford():
			%UButton5.disabled = false
	else:
		%UButton5.disabled = true
	

	
	## Animation
	if House_SpriteAn == null:
		House_SpriteAn = get_node_or_null("/root/Game/GameInterface/Houses/Brick_House/Sprite2D")
	if House_SpriteAn2 == null:
		House_SpriteAn2 = get_node_or_null("/root/Game/GameInterface/Houses/HouseB1/Sprite2D")
		
	#3 Node
	if House_Sprite == null:
		House_Sprite = get_node_or_null("/root/Game/GameInterface/Houses/Brick_House")
	if House_Sprite2 == null:
		House_Sprite2 = get_node_or_null("/root/Game/GameInterface/Houses/HouseB1")



func _on_pressed() -> void:
	if can_afford():
		consume_red()
		House_SpriteAn.play("3")
		House_Sprite.position.x = 408.3
		House_Sprite2.queue_free()
		level += 1
		purchase.play()
	
	

## Func to cosnume coins
func consume_red() -> void:
	RootNode_Game.ref.data.red_crystal -= price
		
		
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.red_crystal >= price:
		return true
	return false
