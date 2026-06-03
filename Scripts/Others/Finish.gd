extends CanvasLayer

@export_file var Level: String
@onready var Text: Label = $Panel/Container/Text
@export_file("*.tscn") var nextLevel: String

func _ready() -> void:
	Text.text = "Congrats! You have finished Level " + Level
	$Panel.hide()

func _on_next_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(nextLevel)

func _on_end_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
