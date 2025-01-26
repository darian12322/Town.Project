extends TextureRect
class_name Upgrade2_for_third_house


var price = 1
var level = 0
var House_SpriteAn: AnimatedSprite2D = null
var House_Sprite: Node = null

@onready var u_button_6: Button = %UButton6
@onready var purchase: AudioStreamPlayer = $"../../../../../../../Purchase"



func _ready() -> void:
	pass # Replace with function body.
	


func _process(_delta: float) -> void:
	if House_SpriteAn and House_SpriteAn.animation == "2":
		if can_afford():
			$UButton6.disabled = false
			
	else: 
		$UButton6.disabled = true
		
	
	
	
	## Node
	if House_Sprite == null:
		House_Sprite = get_node_or_null("/root/Game/GameInterface/Houses/Church")
		
	## Animation
	if House_SpriteAn == null:
		House_SpriteAn = get_node_or_null("/root/Game/GameInterface/Houses/Church/AnimatedSprite2D")
	

func _on_u_button_6_pressed() -> void:
	if can_afford():
		consume_gred()
		House_SpriteAn.play("3")
		level += 1
		purchase.play()
## Func to cosnume coins
func consume_gred() -> void:
	RootNode_Game.ref.data.green_crystal-= price
		
		
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.green_crystal >= price:
		return true
	return false
