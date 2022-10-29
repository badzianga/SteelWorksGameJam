extends KinematicBody2D

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 1000

var velocity = Vector2.ZERO
var current_item: String = ""


func _physics_process(delta):
	# get movement
	var vector = Vector2.ZERO
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# move player
	if vector != Vector2.ZERO:
		velocity = velocity.move_toward(vector.normalized() * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

	# interact with objects
	if Data.in_area != "":
		if Input.is_action_just_pressed("ui_accept"):
			match Data.in_area:
				"Child":
					pass
				"Milk":
					current_item = "Milk"
				"Diapers":
					current_item = "Diapers"
				"Desk":
					pass
			print("Item: " + current_item)
			print("Area: " + Data.in_area)


func _on_InteractionArea_body_entered(body):
	print(body.name)
	if body.name in ["Child", "Desk", "Milk", "Diapers"]:
		Data.in_area = body.name
	

func _on_InteractionArea_body_exited(_body):
	Data.in_area = ""
