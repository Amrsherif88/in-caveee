extends CharacterBody2D



@onready var animation = $AnimationPlayer2



func _ready():
	animation.play("x")
	pass # Replace with function body.
