extends Button

var tooltip_instance: Control

func _make_custom_tooltip(_for_text: String) -> Object:
	
	var tooltip = preload("res://Game/GameObj/Popup/Tooltip.tscn").instantiate()
	
	tooltip.get_node("CanvasLayer/VBoxContainer/Label").text = str("Buy the third House")
	tooltip.get_node("CanvasLayer/VBoxContainer/Label2").text = str("Generate 10 gold / second")
	
	return tooltip










func _on_mouse_entered() -> void:
	tooltip_instance = _make_custom_tooltip("Da")
	get_tree().root.add_child(tooltip_instance)
	
	

func _on_mouse_exited() -> void:
	tooltip_instance.queue_free()
