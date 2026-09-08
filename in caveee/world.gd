extends Node2D
@onready var background: AudioStreamPlayer = $background
@onready var audio_stream_player: AudioStreamPlayer = $background/AudioStreamPlayer


	
func _ready():
	$background.play()
	$background/AudioStreamPlayer.play()
