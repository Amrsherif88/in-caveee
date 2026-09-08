extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		body.respawn_point = global_position
		$AnimationPlayer.play(" used")
	pass # Replace with function body.
