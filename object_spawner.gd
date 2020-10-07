extends Spatial


var Obj = load("res://object_prefab.tscn")
export var rd: float = 1
export var maxobj: int = 2

func _process(_delta):
	if Input.is_action_just_pressed("spawn"):
		var object = Obj.instance()
		object.translation += Vector3(rand_range(-rd, rd), rand_range(-rd, rd), rand_range(-rd, rd))
		add_child(object)
		
		if get_child_count() > maxobj:
			get_child(0).queue_free()
