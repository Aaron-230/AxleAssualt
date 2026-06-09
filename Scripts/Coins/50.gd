extends Area2D

@export var Value: int = 50

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Autoload.addCoins(Value)
		get_tree().get_current_scene().updateCoins()
		$Animation.play("Pickup")
		$Shape.set_deferred("disabled", true)

func _on_animation_animation_finished():
	queue_free()
