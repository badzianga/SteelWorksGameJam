extends Control

func _on_Timer_timeout():
	$TextureProgress.value -= Data.BAR_TIMEOUT_DECREASE_VALUE
