extends CanvasLayer

signal transitioned()
signal transition_finished()

export var close_duration =1.0
export var open_duration =1.0

var close_transition = null
var open_transition = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func transition(_close_transition_id = global.Transition_fade, _open_transition_id = global.Transition_fade):
	var close_ps = global.get_transition_scene(_close_transition_id)
	if close_ps:
		close_transition = close_ps.instance()
		close_transition.layer = 10
		add_child(close_transition)
	var open_ps = global.get_transition_scene(_open_transition_id)
	if open_ps:
		open_transition = open_ps.instance()
		open_transition.layer = 20
		add_child(open_transition)		
	
	if close_transition and open_transition:
		close_transition.connect("transition_closed", self, "_on_transition_closed")
		close_transition.set_duration(close_duration)
		open_transition.connect("transition_opened", self, "_on_transition_opened")
		open_transition.set_duration(open_duration)
		close_transition.close_scene()

func _on_transition_closed() -> void:
	
	if open_transition:
		open_transition.open_scene()
	emit_signal("transitioned")
	pass # Replace with function body.

func _on_transition_opened()->void:
	if close_transition:
		close_transition.queue_free()
		close_transition = null
	if open_transition:
		open_transition.queue_free()
		open_transition = null
	emit_signal("transition_finished")
