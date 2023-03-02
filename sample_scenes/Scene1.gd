extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_Button_pressed() -> void:
	global.transition_scene("res://sample_scenes/Scene2.tscn", 1.0, global.Transition_checker, 1.0, global.Transition_fade)
	pass # Replace with function body.


