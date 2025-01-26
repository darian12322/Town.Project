extends CanvasLayer
class_name Waon_start_text

var dialog = 0

var current_length = 0
@onready var voice: AudioStreamPlayer = $Voice

@onready var Text_box: CanvasLayer = $"."
@onready var text_box: TextureRect = $Text_Box
@onready var label: Label = $Text_Box/MarginContainer/Label
@onready var timer: Timer = $Timer
var text_length



func _ready() -> void:
	label.set_visible_characters(0)
	voice.play()

func _process(_delta: float) -> void:
	
		
	if dialog == 0:
		label.text = "Hello, my name is not important. I am a seller of rare items. Who knows what you can do with them? So, do you want to buy? (desperately) And I've also heard that something mysterious happens when you reach the amount of 44,200"
		text_length = label.text.length()
		
	elif dialog == 1:
		label.text = "You can only buy one from me! And I don’t come around very often, so think carefully about what you’ll do with it and how you’ll use it. So, do you want to buy? (again desperately)"
		text_length = label.text.length()
		
		RootNode_Game.ref.data.wagon_buy = 1
	elif dialog == 2:
		$".".queue_free()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		if current_length < label.text.length():
			label.set_visible_characters(text_length)
			current_length = text_length
		else:
			dialog += 1
			label.set_visible_characters(0)
			current_length = 0
func _on_timer_timeout() -> void:
	if current_length < text_length:
		current_length += 1
		label.set_visible_characters(current_length)
		
		
		
