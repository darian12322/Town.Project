extends Button
class_name Upgrade2_for_first_house


@onready var purchase: AudioStreamPlayer = $"../../../../../../../../Purchase"

var price = 1
var level = 0
var House_SpriteAn: AnimatedSprite2D = null
var House_Sprite2An : AnimatedSprite2D = null
var House_Sprite: Node = null
var House_Sprite2: Node = null
@onready var u_button_4: Upgrade2_for_first_house = %UButton4





func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if House_SpriteAn and House_SpriteAn.animation == "2" and level == 0 and House_Sprite2An and House_Sprite2An.animation == "2":
		if can_afford():
			%UButton4.disabled = false
	else:
		%UButton4.disabled = true


	
	
	
	
	## Animations
	if House_SpriteAn == null:
		House_SpriteAn = get_node_or_null("/root/Game/GameInterface/Houses/WoodHouse/AnimatedSprite2D")
	if House_Sprite2An == null:
		House_Sprite2An = get_node_or_null("/root/Game/GameInterface/Houses/House1/AnimatedSprite2D")
		
				## Nodes	
	if House_Sprite == null:
		House_Sprite = get_node_or_null("/root/Game/GameInterface/Houses/WoodHouse")
	if House_Sprite2 == null:
		House_Sprite2 = get_node_or_null("/root/Game/GameInterface/Houses/House1")
		
		
	
	
	
	## Buttton Press
func _on_pressed() -> void:
	if can_afford():
		consume_red()
		level += 1
		House_Sprite2.queue_free()
		House_SpriteAn.play("3")
		House_Sprite.position.x = 186
		purchase.play()
	
	
## Func to cosnume coins
func consume_red() -> void:
	RootNode_Game.ref.data.red_crystal -= price
		
		
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.red_crystal >= price:
		return true
	return false
