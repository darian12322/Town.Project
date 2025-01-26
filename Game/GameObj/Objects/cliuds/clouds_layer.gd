extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var animation_player_3: AnimationPlayer = $AnimationPlayer3
@onready var animation_player_4: AnimationPlayer = $AnimationPlayer4
@onready var animation_player_5: AnimationPlayer = $AnimationPlayer5




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("clouds")
	animation_player_2.play("1")
	animation_player_3.play("1")
	animation_player_4.play("1")
	animation_player_5.play("1")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
