extends Node2D


func _ready():
	Data.reset(1)  # TODO delete that later dumbass
	
	$GUI/HappinessBar/Timer.wait_time = Data.happiness_decrease
	$GUI/HungerBar/Timer.wait_time = Data.hunger_decrease
	$GUI/HygieneBar/Timer.wait_time = Data.hygiene_decrease

	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.play()
