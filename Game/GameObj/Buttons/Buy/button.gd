extends Button

@onready var texture_rect = $TextureRect 
@export var timer : Timer


func _process(_delta: float) -> void:
	if RootNode_Game.ref.data.cutscene == 1:
		texture_rect.visible = false




func _on_pressed() -> void:
	texture_rect.visible = true
	


func _on_quit_pressed() -> void:
	texture_rect.visible = false
