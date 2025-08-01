extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var animation_total_time := 0.2
@export var GRID_SIZE := 16

var inputs = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}

var tween

func _ready() -> void:
	animation_player.speed_scale = 1 / animation_total_time
	
func _input(event):
	if event.is_action_pressed("interact1"):
		GameController.emit_signal("interact_pressed")
		return

	for action in inputs.keys():
		if event.is_action_pressed(action):
			try_move(inputs[action] * GRID_SIZE)

func try_move(motion: Vector2) -> void:
	if motion == Vector2.ZERO:
		return

	if test_move(global_transform, motion):
		return

	animate_walk(motion)

func animate_walk(motion: Vector2) -> void:
	sprite.stop()
	if motion.x != 0:
		sprite.flip_h = motion.x < 0
	
	animation_player.stop()
	sprite.stop()
	animation_player.play("walk", -1, animation_total_time/1, false)

	if tween and tween.is_running():
		tween.stop()
		tween.custom_step(1.0) 
		tween.kill()

	var end_pos = position + motion

	tween = create_tween()
	tween.tween_property(self, "position", end_pos, animation_total_time) \
		.set_trans(Tween.TransitionType.TRANS_SINE) \
		.set_ease(Tween.EaseType.EASE_IN_OUT)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	sprite.play("Idle")

func _on_animated_sprite_2d_animation_finished() -> void:
	sprite.play("Idle")
