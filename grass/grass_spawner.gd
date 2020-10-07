extends Spatial


export var size: Vector3 = Vector3.ZERO
export var spacing: int = 1.5
var Grass = load("res://grass/grass_prefab.tscn")

func place_grass(pos: Vector3):
	var grass = Grass.instance()
	grass.translation = pos
	add_child(grass)
	


func _ready():
	var origin = translation - size/2
	for x in range(origin.x, origin.x + size.x + 1):
		if x % spacing == 0:
			for z in range(origin.z, origin.z + size.z + 1):
				if z % spacing == 0:
					place_grass(Vector3(x, size.y, z))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
