extends Panel


@onready var tower = preload("res://towers/red_tower.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		print("left click down")
	elif event is InputEventMouseMotion and event.button_mask == 1:
		print("left click down drag")
	elif event is InputEventMouseButton and event.button_mask == 0:
		print("left click up")
