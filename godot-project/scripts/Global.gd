extends Node

var score: int = 0
var health: int = 100
var current_level: int = 0

func add_score(points: int):
	score += points

func reset_score():
	score = 0

func take_damage(damage: int):
	health -= damage
	if health <= 0:
		health = 0
		get_tree().change_scene_to_file("res://scenes/DefeatScreen.tscn")

func reset_health():
	health = 100

func next_level():
	current_level += 1
	if current_level >= 4:
		get_tree().change_scene_to_file("res://scenes/VictoryScreen.tscn")
	else:
		get_tree().reload_current_scene()