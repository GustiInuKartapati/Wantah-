extends CharacterBody2D

@onready var parent = get_parent() as PathFollow2D

func get_ready():
	parent.progress_ratio = randf()

func _physics_process(delta):
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + 200 * delta)
	if Input.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
