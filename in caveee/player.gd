extends CharacterBody2D

@onready var dead = $dead
@onready var jump = $jump
var SPEED = 190
var  JUMP_VELOCITY = -260
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var respawn_point = Vector2(0,0)



func _ready():
	respawn_point = global_position 



func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):

		$Sprite2D.flip_h = true
		$AnimationPlayer.play("move")
	
	elif Input.is_action_pressed("ui_right"):

		$Sprite2D.flip_h = false
		$AnimationPlayer.play("move")

	else :
		$AnimationPlayer.play("idle")



		
		
		
		
		
		
		# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
			





	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		jump.play()
		velocity.y = JUMP_VELOCITY

		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		global_position = respawn_point
		$dead.play()
	pass # Replace with function body.
