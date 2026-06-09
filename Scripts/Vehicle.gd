extends RigidBody2D

var Wheels = []
var Speed = 7500
var MaxSpeed = 450
var Fuel = 100
var Dead = false
var Driving = 0

@onready var Sprite: Sprite2D = $Head/Sprite
@onready var Body: Sprite2D = $Body
@onready var Car: Sprite2D = $Car


func _ready():
	Driving = 0
	Wheels = get_tree().get_nodes_in_group("Wheel")
	get_parent().UpdateFuel(Fuel)
	
	Sprite.texture = load(Autoload.SelectedSprite)
	Body.texture = load(Autoload.SelectedBody)
	Car.texture = load(Autoload.SelectedCar)

func _physics_process(delta):
	if Fuel > 0 && !Dead:
		Driving = 0
		$GameOver.stop()
		if Input.is_action_pressed("Accelerate"):
			apply_torque_impulse(-6000 * delta * 60)
			
			Driving += 1
			for Wheel in Wheels:
				if Wheel.angular_velocity < MaxSpeed:
					Wheel.apply_torque_impulse(Speed * delta * 60)
		
		if Input.is_action_pressed("Reverse"):
			apply_torque_impulse(6000 * delta * 60)
			Driving += 1
			for Wheel in Wheels:
				if Wheel.angular_velocity > -MaxSpeed:
					Wheel.apply_torque_impulse(-Speed * delta * 60)
	else: 
		if $GameOver.is_stopped():
			$GameOver.start()
	
	if $Head.rotation_degrees > 90 || $Head.rotation_degrees < -90 && !Dead:
		Dead = true
		Autoload.Coins = 0
		Driving = 0
		$Head/Neck.node_b = ""
		$Head/Head.node_b = ""
	
	if Driving >= 1:
		$Engine.pitch_scale = lerp($Engine.pitch_scale, 2.0, 2 * delta)
		UseFuel(delta)
	else:
		$Engine.pitch_scale = lerp($Engine.pitch_scale, 1.0, 2 * delta)

func Refuel():
	Fuel = 100
	get_parent().UpdateFuel(Fuel)

func UseFuel(delta):
	Fuel -= 11 * delta
	Fuel = clamp(Fuel, 0, 100)
	get_parent().UpdateFuel(Fuel)


func _on_game_over_timeout() -> void:
	get_tree().reload_current_scene()
