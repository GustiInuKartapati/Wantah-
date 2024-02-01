extends Panel


@onready var tower = preload("res://towers/red_tower.tscn")
var currTile
var tempPos

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		#print("left click down")
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if get_child_count(1) > 1:
			get_child(1).global_position = event.global_position
			tempPos = event.global_position
		print(event.global_position)
		#print("left click down drag")
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child_count(1) > 1:
			get_child(1).queue_free()
		var path = get_tree().get_root().get_node("Main/Towers")
		path.add_child(tempTower)
		tempTower.global_position = tempPos
		tempTower.get_node("Area").hide()
		if tempTower.global_position.x > 2112:
			tempTower.queue_free()
		print(tempPos)
		#print("left click up")
		
	else:
		if get_child_count(1) > 1:
			get_child(1).queue_free()
