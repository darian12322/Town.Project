class_name RootNode_Game
extends Node


static var ref : RootNode_Game

## Declaring the label(coins) and timer and more!
@onready var wagon_timer: Timer = $WagonTimer



var label: Label
var label1: Label
var label_RCrystal: Label
var label_GCrystal: Label
var timer: Timer
var target_node: Node = null
var wagon_node: Node = null
var coins_per_second: int = 0
var previous_coins: int = 0
var current_coins: int = 0
var Bypass: bool = false
var wagon = preload("res://Game/GameObj/Objects/Wagon/wagon.tscn")
var chains = preload("res://Game/GameObj/Objects/chains/chain_container.tscn")
var wagon_spawn: bool = false
var chains_b: bool = false
var final_timer: int = 0
var minute: int = 0
var second: int = 0
var Ftimer: float = 0.0



##Singleton
func _singleton() -> void:
	if not ref:
		ref = self
		return
	queue_free()
	
	
var data : Data

## Singleton data initialization
func _enter_tree() -> void:
	_singleton()
	data = Data.new()





## Get the label path and timer path for 2/s 
func _ready() -> void:
	target_node = get_node("GameInterface/Obj_Main_Map")
	
	
	$WagonTimer.wait_time = 5
	label = get_node("GameUI/CanvasLayer/VBoxContainer/Label")
	label1 = get_node("GameUI/CanvasLayer/VBoxContainer/Label2")
	label_RCrystal = get_node("GameUI/CanvasLayer/HBoxContainer2/Label")
	label_GCrystal = get_node("GameUI/CanvasLayer/LabelGreen")
	timer = get_node("/root/Game/GameUI/CanvasLayer/ButtonBuy/Button/TextureRect/TabContainer/Constructions/ScrollContainer/VBoxContainer/Up1/Timer")
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	previous_coins = 0
	
	
	## Update the label and the wagon node
func _process(_delta: float) -> void:
	Ftimer += _delta
	second = fmod(Ftimer, 60)
	minute = fmod(Ftimer, 3600) / 60

		## 44200
	if RootNode_Game.ref.data.coins >= 44200 and chains_b == false:
		instchain(Vector2(511, -66))
	
	
	
	update_label()
	update_label1()
	update_lebelRcrystal()
	update_labelGcrystal()
	wagon_node = get_node_or_null("/root/Game/GameInterface/Map/Obj_Main_Map/Wagon")	
	
	
func _on_timer_timeout():
	
	coins_per_second = RootNode_Game.ref.data.coins - previous_coins
	previous_coins = RootNode_Game.ref.data.coins
	coins_per_second = max(coins_per_second, 0)
	Bypass = true
	
	


## Update the label function
func update_label() -> void:
	label.text = str(RootNode_Game.ref.data.coins) 

	## Update coins per sec
func update_label1() -> void:
	if coins_per_second > 0:
		label1.text = str(coins_per_second) + "/s"
	elif Bypass == false:
		label1.text = "0/s"
	else:
		label1.text = "Calculating /s"

func update_lebelRcrystal() -> void:
	label_RCrystal.text = str(RootNode_Game.ref.data.red_crystal)
	
func update_labelGcrystal() -> void:
	label_GCrystal.text = str(RootNode_Game.ref.data.green_crystal)


##----------------------------------------------Wagon--------------------------------------------------

func inst(pos):
	var instance = wagon.instantiate()
	instance.position = pos
	target_node.add_child(instance)  




func _on_wagon_timer_timeout() -> void:
	if wagon_spawn == false:
		wagon_spawn = true
		inst(Vector2(700,126))
		$WagonTimer.stop()
		
		

func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	$WagonTimer.start()
	wagon_spawn = false


##---------------------------------------------chains--------------------------------------------------

func instchain(pos) -> void:
	chains_b = true
	var instance = chains.instantiate()
	instance.position = pos
	target_node.add_child(instance) 



	
