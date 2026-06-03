extends Area2D

@export var Value: int = 5

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().get_current_scene().addCoins(Value)
		$Animation.play("Pickup")
		$Shape.set_deferred("disabled", true)

func _on_animation_animation_finished():
	queue_free()
