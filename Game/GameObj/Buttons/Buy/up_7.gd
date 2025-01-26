extends TextureRect
class_name Final_Upgrade

var price = 2
var level = 0

@onready var purchase: AudioStreamPlayer = $"../../../../../../../Purchase"

var House_Merge = preload("res://Game/GameObj/Houses/MergeB/merge_b.tscn")
var House1_sprite: Node = null
var House2_sprite: Node = null
var House3_sprite: Node = null
var target_node: Node = null
@onready var u_button_7: Button = %UButton7


func _ready() -> void:
	target_node = get_node("/root/Game/GameInterface/Houses")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	if RootNode_Game.ref.data.finished == 3:
		if can_afford():
			
			%UButton7.disabled = false
		else:
			
			%UButton7.disabled = true
	else:
			%UButton7.disabled = true
			
	
	
	
	
	## Get house node
	if House1_sprite == null:
		House1_sprite = get_node_or_null("/root/Game/GameInterface/Houses/WoodHouse")
		
	if House2_sprite == null:	
		House2_sprite = get_node_or_null("/root/Game/GameInterface/Houses/Brick_House")
		
	if House3_sprite == null:
		House3_sprite = get_node_or_null("/root/Game/GameInterface/Houses/Church")



func _on_u_button_7_pressed() -> void:
	if can_afford():
		inst(Vector2(150, 165))
		RootNode_Game.ref.data.finished += 1
		consume_gred()
		House1_sprite.visible = false
		House2_sprite.visible = false
		House3_sprite.visible = false
		purchase.play()


func inst(pos):
	var instance = House_Merge.instantiate()
	var animated_sprite = instance.get_node("AnimatedSprite2D")
	animated_sprite.play("1")
	instance.position = pos
	target_node.add_child(instance)  






## Func to cosnume coins
func consume_gred() -> void:
	RootNode_Game.ref.data.green_crystal-= price
		
		
## Func to afford the house
func can_afford() -> bool:
	if RootNode_Game.ref.data.green_crystal >= price:
		return true
	return false
