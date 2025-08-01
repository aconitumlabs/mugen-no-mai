extends TileMapLayer

func _ready() -> void:
	hide()
	GameController.interact_pressed.connect(_on_global_interact)

func _on_global_interact() -> void:
	show()
	# clona o tileset para não mexer no original compartilhado
	var ts := tile_set.duplicate()
	# desativa colisão da physics layer 0
	ts.set_physics_layer_collision_layer(0, 0)   # layer index 0, mask 0 => sem colisão :contentReference[oaicite:1]{index=1}
	tile_set = ts
	update_internals()
