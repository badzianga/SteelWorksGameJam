extends Control


func _ready():
	return
	var f := File.new()
	f.open("res://score.dat", File.READ)
	Data.score = f.get_var()
	f.close()


func _on_DifficultyCasual_pressed():
	Data.reset(Data.DIFFICULTY_CASUAL)
	get_tree().change_scene("res://World.tscn")


func _on_DifficultyHard_pressed():
	Data.reset(Data.DIFFICULTY_HARD)
	get_tree().change_scene("res://World.tscn")
