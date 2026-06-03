extends CanvasLayer

func _ready():
	$Panel.hide()

func _on_button_pressed():
	get_tree().quit()
