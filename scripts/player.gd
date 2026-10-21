extends CharacterBody2D

const VELOCIDADE := 220.0
const PULO := -420.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = PULO
	velocity.x = Input.get_axis("ui_left", "ui_right") * VELOCIDADE
	move_and_slide()
