extends Node2D
class_name Wagon



var Area2d: Area2D
var Area2d2: Area2D
var Idle: bool = false
var Button_disable: bool = true
var Wagon_menu = preload("res://Game/GameObj/Wagon_Table/wagon_menu.tscn")
var target_node: Node = null
var wagon_menu_node: Node = null
var buttonW: Button 
var Timer_On: bool = false
var Wagon_Text_box1 = preload("res://Game/GameObj/Textbox/text_Box_Wagon/text_box.tscn")
var Wagon_Text_boxFinished = preload("res://Game/GameObj/Textbox/text_Boz_WagonFinished/text_box_Finished.tscn")
var text_box_finished: bool = false
var Buy: bool = false
var Wagon_leaving: bool = false


@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var wagon: CharacterBody2D = $"."
@onready var button: Button = $Button



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root/Game/GameUI/CanvasLayer")
	$AnimatedSprite2D.play("1")
	Area2d = get_node("/root/Game/GameInterface/Obj_Main_Map/Area2D")
	Area2d.connect("body_entered", Callable(self, "area_entered"))
	Area2d2 = get_node("/root/Game/GameInterface/Obj_Main_Map/Area2D2")
	Area2d2.connect("body_entered", Callable(self, "area_entered2"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	

	
	
	if Wagon_leaving == true:
		wagon.scale.x = -1
		$AnimatedSprite2D.play("1")
		$".".position.x += 0.06
	
	
	if Idle == false:
		$".".position.x += -0.06
	if wagon_menu_node == null:
		wagon_menu_node = get_node_or_null("/root/Game/GameUI/CanvasLayer/Wagon-Menu")
		
	if wagon_menu_node:
		if buttonW == null:
			buttonW = wagon_menu_node.get_node_or_null("TextureRect/HBoxContainer/TextureRect/Button")
		if wagon_menu_node.Item_Bought == 1:
				Buy = true
				buttonW.disabled = true
				if Timer_On == false:
					Timer_On = true
					timer.start()
	
	
	
	
## Make the wagon start the idle animation
func area_entered(_body: Node) -> void:
	Idle = true
	$AnimatedSprite2D.play("2")
	if animated_sprite_2d.animation == "2":
		$Button.disabled = false
		Button_disable = false


func area_entered2(_body: Node) -> void:
	wagon.queue_free()

#3 Open the shop
func _on_button_pressed() -> void:
	if text_box_finished == false and RootNode_Game.ref.data.wagon_buy == 0:
		instText()
	elif Buy == false:
		inst(Vector2(260,105))
		
	
##Cool Ef
func _on_button_mouse_entered() -> void:
	if Button_disable == false and Wagon_leaving == false:
		$AnimatedSprite2D.play("Focus")

##Cool Ef
func _on_button_mouse_exited() -> void:
	if Button_disable == false and Wagon_leaving == false:
		$AnimatedSprite2D.play("2")
	
##  instantiate the shop menu
func inst(pos):
	var instance = Wagon_menu.instantiate()
	instance.position = pos
	target_node.add_child(instance)  
	

func instText():
	var instance = Wagon_Text_box1.instantiate()
	target_node.add_child(instance)
	text_box_finished = true
	

func instTextF():
	var instance = Wagon_Text_boxFinished.instantiate()
	target_node.add_child(instance)
	


func _on_timer_timeout() -> void:
	if wagon_menu_node == null:
		$Timer.stop()
		Timer_On = false
		instTextF()
		Wagon_leaving = true
	else:
		Wagon_leaving = true
		wagon_menu_node.queue_free()
		Timer_On = false
		instTextF()


func _on_timer_leaving_timeout() -> void:
	pass # Replace with function body.
