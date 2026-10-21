extends Area2D

func _ready() -> void:
	body_entered.connect(_ao_entrar)

func _ao_entrar(corpo: Node) -> void:
	if corpo is CharacterBody2D:
		GameState.entregar_agua()
