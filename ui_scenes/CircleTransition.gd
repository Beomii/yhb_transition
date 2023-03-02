extends "res://ui_scenes/AbstractTransition.gd"


func close_scene():
	$AnimationPlayer.play("close")
	#$surface.material.set_shader_param("radius", 1)
	$surface.visible = true
	pass
	
func open_scene():
	$AnimationPlayer.play("open")
	#$surface.material.set_shader_param("radius", 0)
	$surface.visible = true
	pass
func set_duration(_duration):
	var speed = 1/float(_duration)
	$AnimationPlayer.playback_speed = speed
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	$surface.material.set_shader_param("screen_width", OS.get_window_safe_area().size.x)
	$surface.material.set_shader_param("screen_height", OS.get_window_safe_area().size.y)
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "close":
		$surface.visible = false
		emit_signal("transition_closed")
	elif anim_name == "open":
		$surface.visible = false
		emit_signal("transition_opened")		
