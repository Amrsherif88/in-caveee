extends CharacterBody2D

var speed = 280
var dir = 1

func _physics_process(delta):
	
	
		
	if is_on_wall():
	
		dir *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		
		pass
	velocity.x = speed * dir

	move_and_slide()
	
	pass

func _ready():
	$AnimationPlayer.play("move")
