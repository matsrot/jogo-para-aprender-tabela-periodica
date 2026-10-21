extends Area2D

@export var simbolo := "H"

func _ready() -> void:
	$Rotulo.text = simbolo
	body_entered.connect(_ao_entrar)

func _ao_entrar(corpo: Node) -> void:
	if corpo is CharacterBody2D:
		GameState.adicionar(simbolo)
		GameState.mensagem.emit("Você coletou: " + simbolo)
		queue_free()
