extends Node

var score: int = 0
var health: int = 3
var shields: int = 0

func add_score(points: int):
	score += points

func reset_score():
	score = 0

func take_damage():
	health -= 1
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/DefeatScreen.tscn")

func gain_shield():
	shields += 1

func reset_game():
	score = 0
	health = 3
	shields = 0