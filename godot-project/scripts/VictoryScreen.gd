extends Control

@onready var score_label = $VBoxContainer/ScoreLabel
@onready var restart_button = $VBoxContainer/RestartButton
@onready var main_menu_button = $VBoxContainer/MainMenuButton
@onready var close_button = $VBoxContainer/CloseButton

func _ready():
	score_label.text = "Final Score: %d" % Global.score
	restart_button.pressed.connect(_on_restart_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	close_button.pressed.connect(_on_close_pressed)

func _on_restart_pressed():
	Global.reset_score()
	Global.reset_health()
	Global.current_level = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_main_menu_pressed():
	Global.reset_score()
	Global.reset_health()
	Global.current_level = 0
	get_tree().change_scene_to_file("res://scenes/StartScreen.tscn")

func _on_close_pressed():
	get_tree().quit()