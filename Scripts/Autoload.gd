extends Node

var SelectedCar = "res://Assets/Car/Car.png"
var SelectedWheel = "res://Assets/Car/Wheel.png"
var SelectedSprite = "res://Assets/Characters/Head.png"
var SelectedBody = "res://Assets/Characters/Body.png"

var Coins = 0

func addCoins(value):
	Coins += value

func getCoins():
	return Coins
