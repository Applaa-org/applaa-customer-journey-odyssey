extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		if Global.shields > 0:
			Global.shields -= 1
		else:
			Global.take_damage()
		queue_free()