extends Area

onready var mat = get_child(0).get_material_override()
export var scale_range: Vector3 = Vector3.ZERO
export var translation_range: Vector3 = Vector3.ZERO
export var rotation_range: Vector3 = Vector3.ZERO

func _ready():
	scale.x += rand_range(-scale_range.x, scale_range.x)
	scale.y += rand_range(-scale_range.y, scale_range.y)
	scale.z += rand_range(-scale_range.z, scale_range.z)
	
	translation.x += rand_range(-translation_range.x, translation_range.x)
	translation.y += rand_range(-translation_range.y, translation_range.y)
	translation.z += rand_range(-translation_range.z, translation_range.z)
	
	rotation_degrees.x += rand_range(-rotation_range.x, rotation_range.x)
	rotation_degrees.y += rand_range(-rotation_range.y, rotation_range.y)
	rotation_degrees.z += rand_range(-rotation_range.z, rotation_range.z)
	
	mat.set_shader_param("GrassPosition", translation)
	mat.set_shader_param("ObjectPosition", translation)
	
func _process(_delta):
	mat.set_shader_param("ObjectPosition", translation)
	for body in get_overlapping_bodies():
		mat.set_shader_param("ObjectPosition", body.translation)
	
