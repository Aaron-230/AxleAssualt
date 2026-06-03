extends RigidBody2D

@onready var Sprite: Sprite2D = $Sprite

func _ready() -> void:
	
	Sprite.texture = load(Autoload.SelectedWheel)
