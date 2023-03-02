extends Node

const GROUP_MAINFRAME_HUD = "mainframe_hud"

const Transition_fade = "transition_fade"
const Transition_circle = "transition_circle"
const Transition_sweep = "transition_sweep"
const Transition_checker = "transition_checker"

var transition_def = {
	Transition_fade:{
		"ps":preload("res://ui_scenes/FadeInOutTransition.tscn")
	},
	Transition_circle:{
		"ps":preload("res://ui_scenes/CircleTransition.tscn")
	},
	Transition_sweep:{
		"ps":preload("res://ui_scenes/SweepTransition.tscn")
	},
	Transition_checker:{
		"ps":preload("res://ui_scenes/CheckerTransition.tscn")
	}
}

var mainframe

#단순화면전환
#param _path 전환할 씬 경로
func change_scene(_path):
	if mainframe:
		mainframe.change_scene(_path)
		
#PackedScene으로 단순화면전환
#param _ps 전환할 PackedScene
func change_scene_ps(_ps):
	if mainframe:
		mainframe.change_scene_ps(_ps)
		
#효과를 이용한 화면전환
#param _path 전환할 씬 경로
#param _close_duration 현재 화면 닫히는 시간(초)
#param _close_transition 현재 화면 닫히는 효과 아이디
#param _open_duration 다음 화면 열리는 시간(초)
#param _open_transition 다음 화면 열리는 효과 아이디
func transition_scene(_path, _close_duration = 0.5,_close_transition_id= global.Transition_fade, _open_duration = 0.5, _open_transition_id=global.Transition_fade):
	if mainframe:
		mainframe.transition_scene(_path, _close_duration, _close_transition_id,_open_duration, _open_transition_id)
		
#효과를 이용한 화면전환
#param _ps 전환할 PackedScene
#param _close_duration 현재 화면 닫히는 시간(초)
#param _close_transition 현재 화면 닫히는 효과 아이디
#param _open_duration 다음 화면 열리는 시간(초)
#param _open_transition 다음 화면 열리는 효과 아이디		
func transition_scene_ps(_ps, _close_duration = 0.5, _close_transition_id= global.Transition_fade,_open_duration = 0.5, _open_transition_id=global.Transition_fade):
	if mainframe:
		mainframe.transition_scene_ps(_ps, _close_duration, _close_transition_id,_open_duration, _open_transition_id)

func get_transition_scene(_transition_id):
	if transition_def.has(_transition_id):
		return transition_def[_transition_id].ps
	return null

func get_prev_scene_path(_offset = 1):
	if mainframe:
		return mainframe.get_prev_scene_path(_offset)
	return null
	
func transition_scene_prev_by_offset(_offset = 1, _transition_params = {"close_duration":0.5,"close_transition_id":global.Transition_fade,"open_duration":0.5,"open_transition_id":Transition_fade}):
	var prev_path = get_prev_scene_path(_offset)
	if prev_path:
		var _close_duration = 0.5
		var _close_transition_id=Transition_fade
		var _open_duration = 0.5
		var _open_transition_id= Transition_fade
		if _transition_params.has("close_duration"):
			_close_duration = _transition_params.close_duration
		if _transition_params.has("close_transition_id"):
			_close_transition_id = _transition_params.close_transition_id
		if _transition_params.has("open_duration"):
			_open_duration = _transition_params.open_duration
		if _transition_params.has("open_transition_id"):
			_open_transition_id = _transition_params.open_transition_id
		transition_scene(prev_path, _close_duration, _close_transition_id, _open_duration, _open_transition_id)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
