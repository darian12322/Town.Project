extends CanvasLayer

@onready var canvas_layer: CanvasLayer = $"."
@onready var button_buy: Node2D = $"../GameUI/CanvasLayer/ButtonBuy"
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	canvas_layer.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if paused == false:
			get_tree().paused = true
			canvas_layer.visible = true
			button_buy.hide()
			paused = true
		else:
			get_tree().paused = false
			canvas_layer.visible = false
			button_buy.show()
			paused = false
func _on_x_pressed() -> void:
	canvas_layer.visible = false
	get_tree().paused = false
	button_buy.show()
	paused = false
func _on_resume_pressed() -> void:
	get_tree().paused = false
	canvas_layer.visible = false
	button_buy.show()
	paused = false
func _on_settings_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Game/Scene/Settings/settings.tscn")
	


func _on_maine_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/Scene/MainMenu/main_menu.tscn")
	
