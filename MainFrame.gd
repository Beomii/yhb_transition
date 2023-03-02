extends Node


class_name MainFrameScene

var current_scene = null

var next_scene_path = null
var next_scene_ps = null

var scene_path_queue = []
var scene_path_queue_size = 3


func push_scene_path_to_queue(_path):
	scene_path_queue.push_back(_path)
	for idx in scene_path_queue.size() - scene_path_queue_size:
		scene_path_queue.pop_front()
#전 씬은 offset 1, 전전 씬은 offset 2
func get_prev_scene_path(_offset=1):
	var need_index = scene_path_queue.size() -1 - _offset
	if need_index < scene_path_queue.size():
		return scene_path_queue[need_index]
	return null
	
func _ready():
	global.mainframe = self
	
	$MainframeHUD.add_to_group(global.GROUP_MAINFRAME_HUD)
	$SceneTransition.connect("transition_finished", self, "on_mainframe_transition_finished")
	
	change_scene("res://sample_scenes/Scene1.tscn")
	
	pass # Replace with function body.

func on_mainframe_transition_finished():
	if current_scene.has_method("mainframe_on_transition_finished"):
		current_scene.mainframe_on_transition_finished()
	pass
func debug_message(_msg):
	$MainframeHUD/DebugLabel.text = str(_msg)

func change_scene(_path):
	if $scene.get_child_count()>0:
		$scene.get_child(0).queue_free()
		current_scene = null
	
	if(ResourceLoader.exists(_path)):
		current_scene = load(_path).instance()
		push_scene_path_to_queue(_path)
	else:
		debug_message(_path+" not exists")
	$scene.add_child(current_scene)

	next_scene_path = null
	return current_scene
	
func change_scene_ps(_ps:PackedScene):
	if $scene.get_child_count()>0:
		$scene.get_child(0).queue_free()
		current_scene = null
	
	current_scene = _ps.instance()
	push_scene_path_to_queue(_ps.resource_path)
	
	$scene.add_child(current_scene)
	
	next_scene_ps = null

func transition_scene(_path, _close_duration = 1.0, _close_transition_id= global.Transition_fade,_open_duration=1.0, _open_transition_id=global.Transition_fade):
	next_scene_path = _path
	$SceneTransition.close_duration = _close_duration
	$SceneTransition.open_duration = _open_duration
	$SceneTransition.transition(_close_transition_id, _open_transition_id)
	
func transition_scene_ps(_ps, _close_duration = 1.0, _close_transition_id= global.Transition_fade,_open_duration=1.0, _open_transition_id=global.Transition_fade):
	next_scene_ps  = _ps
	$SceneTransition.close_duration = _close_duration
	$SceneTransition.open_duration = _open_duration
	$SceneTransition.transition(_close_transition_id, _open_transition_id)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SceneTransition_transitioned():
	if next_scene_ps:
		change_scene_ps(next_scene_ps)
	else:
		if next_scene_path!=null:
			change_scene(next_scene_path)
	pass # Replace with function body.
