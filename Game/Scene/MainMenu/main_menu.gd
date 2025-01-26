class_name RootNode_GameM
extends Node

static var refM : RootNode_GameM

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##Singleton
func _singleton() -> void:
	if not refM:
		refM = self
		return
	queue_free()
	
	
var data1 : Data1

## Singleton data initialization
func _enter_tree() -> void:
	_singleton()
	data1 = Data1.new()
