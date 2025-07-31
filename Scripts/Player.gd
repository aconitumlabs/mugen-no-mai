extends CharacterBody2D

const GRID_SIZE := 16
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var inputs = {
	"Cima": Vector2.UP,
	"Baixo": Vector2.DOWN,
	"Esquerda": Vector2.LEFT,
	"Direita": Vector2.RIGHT
}

var is_animating_jump: bool = false
var original_material: Material = null

func  _ready():
	original_material = sprite.material
	#desativar_shader()

func _unhandled_input(event):
	if is_animating_jump:
		return

	for action in inputs.keys():
		if event.is_action_pressed(action):
			try_move(inputs[action] * GRID_SIZE)

func try_move(motion: Vector2) -> void:
	if motion == Vector2.ZERO:
		return

	if test_move(global_transform, motion):
		return
	if motion.x > 0:
		sprite.flip_h = false
	elif motion.x < 0:
		sprite.flip_h = true
	animate_jump(motion)
	#ativar_shader()

func animate_jump(motion: Vector2) -> void:
	if is_animating_jump:
		return
	is_animating_jump = true

	var start_pos = position
	var end_pos = start_pos + motion
	var total_time := 0.2
	var half_time := total_time * 0.5

	var t = get_tree().create_tween()

	t.tween_property(sprite, "scale", Vector2(1.2, 0.8), half_time) \
	 .set_trans(Tween.TransitionType.TRANS_SINE) \
	 .set_ease(Tween.EaseType.EASE_OUT)
	t.tween_property(sprite, "scale", Vector2.ONE, half_time) \
	 .set_delay(half_time) \
	 .set_trans(Tween.TransitionType.TRANS_SINE) \
	 .set_ease(Tween.EaseType.EASE_IN)

	t.tween_property(sprite, "position:y", -8, half_time) \
	 .set_trans(Tween.TransitionType.TRANS_SINE) \
	 .set_ease(Tween.EaseType.EASE_OUT)
	t.tween_property(sprite, "position:y", 0, half_time) \
	 .set_delay(half_time) \
	 .set_trans(Tween.TransitionType.TRANS_SINE) \
	 .set_ease(Tween.EaseType.EASE_IN)

	t.parallel().tween_property(self, "position", end_pos, total_time) \
	 .set_trans(Tween.TransitionType.TRANS_SINE) \
	 .set_ease(Tween.EaseType.EASE_IN_OUT)

	t.finished.connect(func():
		is_animating_jump = false
		sprite.scale = Vector2.ONE
		sprite.position.y = 0
		#desativar_shader()
	)

#func  ativar_shader():
	#sprite.material = original_material
	
#func desativar_shader():
	#sprite.material = null
