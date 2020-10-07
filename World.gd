extends Spatial


func _ready():
	get_viewport().msaa = 3


func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	pass
