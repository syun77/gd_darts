extends Node2D
# ===============================================
# メインシーン.
# ===============================================

const TARGET_OBJ = preload("res://src/Target.tscn")

@onready var _maker = $Marker2D

func _ready() -> void:
	var t = TARGET_OBJ.instantiate()
	t.position.x = _maker.position.x
	t.position.y = _maker.position.y
	add_child(t)
