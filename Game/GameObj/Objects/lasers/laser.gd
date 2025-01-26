extends Node2D
class_name laser



@onready var label: Label = $CanvasLayer/HBoxContainer/Label
@onready var label_2: Label = $CanvasLayer/HBoxContainer/Label2
@onready var animated_sprite_2d_2: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D2
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var h_box_container: HBoxContainer = $CanvasLayer/HBoxContainer
@onready var blast: AudioStreamPlayer = $Blast
@onready var explosion: AudioStreamPlayer = $Explosion
@onready var button: Button = $CanvasLayer/Button




var Game: Node = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h_box_container.hide()
	animation_player.play("1")
	animated_sprite_2d_2.hide()
	Game = get_node("/root/Game")
	button.hide()
	label.text = "%02d:" % Game.minute
	label_2.text = "%02d" % Game.second
	

func _process(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	animation_player.play("2")
	animated_sprite_2d_2.show()
	h_box_container.show()
	button.show()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Game/Scene/MainMenu/main_menu.tscn")
