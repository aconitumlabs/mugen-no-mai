extends AnimatedSprite2D

@export var radius: float = 16.0 
@export var angular_speed: float = 2.0

var _angle: float = 0.0

func _physics_process(delta: float) -> void:
	_angle += angular_speed * delta
	position = Vector2(cos(_angle), sin(_angle)) * radius
