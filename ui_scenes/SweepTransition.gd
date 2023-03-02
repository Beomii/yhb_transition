extends "res://ui_scenes/AbstractTransition.gd"

func close_scene():
	$surface.visible = true
	$surface.material.set_shader_param("effect", 1)
	$AnimationPlayer.play("close")
	pass
	
func open_scene():
	$surface.visible = true
	$surface.material.set_shader_param("effect", 0)
	$AnimationPlayer.play("open")
	pass
func set_duration(_duration):
	var speed = 1/float(_duration)
	$AnimationPlayer.playback_speed = speed
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "close":
		$surface.visible = false
		emit_signal("transition_closed")
	elif anim_name == "open":
		$surface.visible = false
		emit_signal("transition_opened")	
