extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		Global.health += 20
		Global.add_score(20)
		queue_free()