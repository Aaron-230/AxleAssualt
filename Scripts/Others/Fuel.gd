extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().get_current_scene().get_node("Vehicle").Refuel()
		$Animation.play("Pickup")
		$Shape.set_deferred("disabled", true)


func _on_animation_animation_finished(anim_name: StringName) -> void:
	queue_free()
