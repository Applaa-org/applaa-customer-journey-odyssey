extends Node2D

@onready var player = $Player
@onready var score_label = $UI/ScoreLabel
@onready var health_label = $UI/HealthLabel
@onready var shields_label = $UI/ShieldsLabel
@onready var galaxy_label = $UI/GalaxyLabel

var current_galaxy = 0
var galaxies = ["Awareness Galaxy", "Consideration Galaxy", "Conversion Galaxy", "Loyalty Galaxy"]
var galaxy_positions = [0, 2000, 4000, 6000]  # Approximate positions for progression

func _ready():
	update_ui()
	galaxy_label.text = galaxies[current_galaxy]

func _process(delta):
	# Scroll background or move player to simulate flying
	if player.position.x > galaxy_positions[current_galaxy + 1] if current_galaxy < galaxies.size() - 1 else false:
		current_galaxy += 1
		galaxy_label.text = galaxies[current_galaxy]
		if current_galaxy == galaxies.size() - 1:
			get_tree().change_scene_to_file("res://scenes/VictoryScreen.tscn")

func update_ui():
	score_label.text = "Score: %d" % Global.score
	health_label.text = "Health: %d" % Global.health
	shields_label.text = "Shields: %d" % Global.shields