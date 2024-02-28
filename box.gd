extends Node3D

@export var box : PackedScene
@export var random : float
@onready var multimesh = $MultiMeshInstance3D as MultiMeshInstance3D
@onready var box_parent = $BoxParent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var new_box = box.instantiate()
	new_box.position = self.position + Vector3(randf_range(random, -random), randf_range(random, -random), randf_range(random, -random))
	box_parent.call_deferred("add_child", new_box)
	multimesh.multimesh.instance_count += 1

func _process(_delta):
	for i in range(multimesh.multimesh.instance_count):
		var position = Transform3D()
		position = (box_parent.get_children()[i]).transform
		multimesh.multimesh.set_instance_transform(i, position)
	print((multimesh.multimesh.instance_count))
