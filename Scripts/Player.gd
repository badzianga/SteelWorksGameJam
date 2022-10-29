extends KinematicBody2D

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 1000

var velocity = Vector2.ZERO
var current_item := ""
var in_area := ""

onready var animationTree := $AnimationTree
onready var animationState = $AnimationTree.get("parameters/playback")


func _ready():
	animationTree.active = true


func _physics_process(delta):
	# get movement
	var vector = Vector2.ZERO
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vector = vector.normalized()

	# move player
	if vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", vector)
		animationTree.set("parameters/Run/blend_position", vector)
		print(animationTree.get("parameters/Idle/blend_position"))
		animationState.travel("Run")
		velocity = velocity.move_toward(vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

	# interact with objects
	if in_area != "":
		if Input.is_action_just_pressed("ui_accept"):
			match in_area:
				"Child":
					if current_item == "Milk":
						pass  # feeding TODO
					elif current_item == "Diapers":
						pass  # hajżin TOOD
					else:
						pass  # singing and lullabying TODO
					current_item = ""
				"Milk":
					if current_item == "Milk":
						current_item = ""
					else:
						current_item = "Milk"
				"Diapers":
					if current_item == "Milk":
						current_item = ""
					else:
						current_item = "Diapers"
				"Desk":
					pass  # what to do? TODO
			print("Item: " + current_item)
			print("Area: " + in_area)


func _on_InteractionArea_body_entered(body):
	print(body.name)
	if body.name in ["Child", "Desk", "Milk", "Diapers"]:
		in_area = body.name


func _on_InteractionArea_body_exited(_body):
	in_area = ""


func _on_InteractionArea_area_entered(area):
	if area.name == "BetweenRooms":
		current_item = ""
