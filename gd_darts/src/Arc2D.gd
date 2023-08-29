extends Node2D

@export var radius = 128.0
@export var start_angle = 0.0
@export var end_angle = PI/2/2 # 90度
@export var color = Color.WHITE
@export var divide = 16

func _process(_delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	var points = PackedVector2Array()
	var colors = PackedColorArray()
	points.append(Vector2.ZERO)
	colors.append(color)
	var rad = start_angle
	var d = (end_angle - start_angle) / (divide - 1)
	for i in range(divide):
		var v = Vector2()
		v.x = radius * cos(rad)
		v.y = radius * sin(rad)
		points.append(v)
		colors.append(color)
		rad += d
	draw_polygon(points, colors)
