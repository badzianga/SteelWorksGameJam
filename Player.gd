extends KinematicBody2D

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 1000

var velocity = Vector2.ZERO

func _physics_process(delta):
		var vector = Vector2.ZERO
		vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

		if vector != Vector2.ZERO:
			velocity = velocity.move_toward(vector.normalized() * MAX_SPEED, ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		velocity = move_and_slide(velocity)


func _on_InteractionArea_body_entered(body):
	match body.name:
		"Child":
			pass
		"Desk":
			pass
		"Milk":
			pass
		"Diapers":
			pass


func _on_InteractionArea_body_exited(_body):
	Data.in_area = ""
