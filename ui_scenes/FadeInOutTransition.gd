extends "res://ui_scenes/AbstractTransition.gd"


func close_scene():
	$surface.visible = true
	$surface.color.a = 0.0
	$AnimationPlayer.play("fade_to_black")
	
	pass
	
func open_scene():
	$surface.visible = true
	$surface.color.a = 1.0
	$AnimationPlayer.play("fade_out")
	
	pass

func set_duration(_duration):
	var speed = 1/float(_duration)
	$AnimationPlayer.playback_speed = speed
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_to_black":
		$surface.visible = false
		emit_signal("transition_closed")
	elif anim_name == "fade_out":
		$surface.visible = false
		emit_signal("transition_opened")
	pass # Replace with function body.
