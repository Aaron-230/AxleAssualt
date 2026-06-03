extends Control

@export_file("*.tscn") var nextScene: String
@onready var StartButton: Button = $VBoxContainer/Start

var RedCar = "res://Assets/Car/RedCar.png"
var BlueCar = "res://Assets/Car/Car.png"

var SmallWheel = "res://Assets/Car/Wheel.png"
var MidWheel = "res://Assets/Car/WheelMedium.png"
var BigWheel = "res://Assets/Car/WheelBig.png"

var Human = "res://Assets/Characters/Head.png"
var Robot = "res://Assets/Characters/Head2.png"
var HumanBody = "res://Assets/Characters/Body.png"
var RobotBody = "res://Assets/Characters/Body2.png"

var SelectedCar: String
var SelectedWheel: String
var SelectedSprite: String
var SelectedBody: String

func _ready() -> void:
	StartButton.disabled = true

func _on_red_pressed() -> void:
	SelectedCar = RedCar
	Autoload.SelectedCar = RedCar

func _on_blue_pressed() -> void:
	SelectedCar = BlueCar
	Autoload.SelectedCar = BlueCar

func _on_small_pressed() -> void:
	SelectedWheel = SmallWheel
	Autoload.SelectedWheel = SmallWheel

func _on_medium_pressed() -> void:
	SelectedWheel = MidWheel
	Autoload.SelectedWheel = MidWheel

func _on_big_pressed() -> void:
	SelectedWheel = BigWheel
	Autoload.SelectedWheel = BigWheel

func _on_human_pressed() -> void:
	SelectedSprite = Human
	Autoload.SelectedSprite = Human
	SelectedBody = HumanBody
	Autoload.SelectedBody = HumanBody

func _on_robot_pressed() -> void:
	SelectedSprite = Robot
	Autoload.SelectedSprite = Robot
	SelectedBody = RobotBody
	Autoload.SelectedBody = RobotBody

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(nextScene)

func _on_start_focus_entered() -> void:
	if SelectedCar == '' || SelectedWheel == '' || SelectedSprite == '':
		StartButton.disabled = true
	else:
		StartButton.disabled = false
