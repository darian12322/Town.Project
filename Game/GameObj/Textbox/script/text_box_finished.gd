extends CanvasLayer
class_name Finish_Wagon

var dialog = 0

var current_length = 0


@onready var text_box_finished: Finish_Wagon = $"."
@onready var text_box: TextureRect = $text_box
@onready var label: Label = $text_box/MarginContainer/Label
@onready var timer: Timer = $Timer
var text_length




func _ready() -> void:
	label.set_visible_characters(0)
	print(self.get_path())

func _process(_delta: float) -> void:
	if dialog == 0:
		label.text = "Farewell, stranger!"
		text_length = label.text.length()
	elif dialog == 1:
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
