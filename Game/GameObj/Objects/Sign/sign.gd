extends Node2D

var timer: Timer = null
var tooltip_instance: CanvasLayer = null

func _ready() -> void:
	timer = get_node("/root/Game/WagonTimer")

func _make_custom_tooltip(_for_text: String) -> CanvasLayer:
	var tooltip = preload("res://Game/GameObj/Popup/canvas_layer.tscn").instantiate()
	tooltip.get_node("PanelContainer/Label").text = "Next Wagon: " + str(int(timer.time_left))
	return tooltip

func _on_button_mouse_entered() -> void:
	if RootNode_Game.ref.data.cutscene == 0:
		
		tooltip_instance = _make_custom_tooltip("Da")
		get_tree().root.add_child(tooltip_instance)
		set_process(true)

func _on_button_mouse_exited() -> void:
	if RootNode_Game.ref.data.cutscene == 0:
		if tooltip_instance:
			tooltip_instance.queue_free()
		set_process(false)

func _process(_delta: float) -> void:
	if tooltip_instance:
		tooltip_instance.get_node("PanelContainer/Label").text = "Next Wagon: " + str(int(timer.time_left))
