extends RigidBody2D



var cutscene = preload("res://Game/GameObj/Objects/lasers/laser.tscn")
var target_node: Node = null
var cutscene_frame = 0


func _ready() -> void:
	target_node = get_node("/root/Game/GameInterface/Houses")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func inst() -> void:
	var instance = cutscene.instantiate()
	target_node.add_child(instance)  


func _on_button_pressed() -> void:
	RootNode_Game.ref.data.cutscene += 1
	get_tree().paused = true
	if cutscene_frame == 0:
		inst()
		cutscene_frame += 1
