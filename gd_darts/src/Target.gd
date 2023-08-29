extends Area2D

@onready var _col = $CollisionPolygon2D

var _radius = 128.0
var _start = 0.0
var _end = 30.0
var _timer = 0.0

func set_collision(radius:float, start:float, end:float) -> void:
	_radius = radius
	_start = deg_to_rad(start)
	_end = deg_to_rad(end)

	var v = Vector2.RIGHT * _radius
	
	var v1 = v.rotated(_start)
	var v2 = v.rotated(_end)
	
	_col.polygon[1] = v1
	_col.polygon[2] = v2
	

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	_timer += delta
	
	var d = _timer * 30
	
	set_collision(128, d, d + 90)

	queue_redraw()
	
func _draw() -> void:
	var div = 16
	var color = Color.WHITE
	var points = PackedVector2Array()
	var colors = PackedColorArray()
	points.append(Vector2.ZERO)
	colors.append(color)
	var rad = _start
	var d = (_end - _start) / (div - 1)
	for i in range(div):
		var v = Vector2()
		v.x = _radius * cos(rad)
		v.y = _radius * sin(rad)
		points.append(v)
		colors.append(color)
		rad += d
	draw_polygon(points, colors)
