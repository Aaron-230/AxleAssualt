extends Node2D

@export_file("*.tscn") var Level: String

var Coins = 0

func addCoins(Amount):
	Coins += Amount
	$UI/Coin/Score.text = str(Coins)

func UpdateFuel(Value):
	$UI/Fuel/Level.value = Value
	var Stylebox = $UI/Fuel/Level.get("theme_override_styles/fill")
	var StartColor = Color("#cf4a4d")
	Stylebox.bg_color = StartColor.lerp("#62ce4b", Value/100)
	
	if Value < 20:
		$UI/Fuel/Animation.play("Alarm")
	else:
		$UI/Fuel/Animation.play("Idle")


func _on_finish_body_entered(body):
	if body.name == "Vehicle":
		get_tree().paused = true
		$Finish2/Panel.show()
