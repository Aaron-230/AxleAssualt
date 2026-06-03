extends CanvasLayer

func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		$Container/Right.visible = true
		$Container2/Left.visible = true
	else:
		$Container/Right.visible = false
		$Container2/Left.visible = false
