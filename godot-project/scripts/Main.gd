extends Node2D

@onready var player = $Player
@onready var score_label = $UI/ScoreLabel
@onready var health_label = $UI/HealthLabel
@onready var level_label = $UI/LevelLabel

var level_names = ["Awareness Galaxy", "Consideration Galaxy", "Conversion Galaxy", "Loyalty Galaxy"]

func _ready():
	update_ui()
	# Spawn collectibles and obstacles based on level
	spawn_entities()

func _process(delta):
	update_ui()

func update_ui():
	score_label.text = "Score: %d" % Global.score
	health_label.text = "Health: %d" % Global.health
	level_label.text = level_names[Global.current_level]

func spawn_entities():
	# Simple spawning for demo - in full game, use more sophisticated placement
	for i in range(10):
		var star = preload("res://scenes/CustomerStar.tscn").instantiate()
		star.position = Vector2(randf_range(100, 900), randf_range(100, 600))
		add_child(star)
	
	if Global.current_level >= 1:
		for i in range(5):
			var shield = preload("res://scenes/RetentionShield.tscn").instantiate()
			shield.position = Vector2(randf_range(100, 900), randf_range(100, 600))
			add_child(shield)
	
	for i in range(3):
		var black_hole = preload("res://scenes/BlackHole.tscn").instantiate()
		black_hole.position = Vector2(randf_range(200, 800), randf_range(200, 500))
		add_child(black_hole)
	
	# Goal at the end
	var goal = preload("res://scenes/Goal.tscn").instantiate()
	goal.position = Vector2(950, 384)
	add_child(goal)