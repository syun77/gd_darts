extends Area2D

@onready var _col = $CollisionPolygon2D

var _timer = 0.0

func set_collision(radius:float, start:float, end:float) -> void:
	var v = Vector2.RIGHT * radius
	
	var v1 = v.rotated(deg_to_rad(start))
	var v2 = v.rotated(deg_to_rad(end))
	
	_col.polygon[1] = v1
	_col.polygon[2] = v2

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	_timer += delta
	
	var d = _timer * 30
	
	set_collision(128, d, d + 30)
