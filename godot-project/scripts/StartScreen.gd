extends Control

@onready var title_label = $VBoxContainer/TitleLabel
@onready var instructions_label = $VBoxContainer/InstructionsLabel
@onready var start_button = $VBoxContainer/StartButton
@onready var close_button = $VBoxContainer/CloseButton

func _ready():
	title_label.text = "Customer Journey Odyssey"
	instructions_label.text = "Fly through galaxies: Awareness, Consideration, Conversion, Loyalty.\nCollect Customer Stars, avoid Drop-Off Black Holes, upgrade with Retention Shields.\nControls: WASD to move, Space to boost, Mouse to interact."
	start_button.pressed.connect(_on_start_pressed)
	close_button.pressed.connect(_on_close_pressed)

func _on_start_pressed():
	Global.reset_score()
	Global.reset_health()
	Global.current_level = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_close_pressed():
	get_tree().quit()