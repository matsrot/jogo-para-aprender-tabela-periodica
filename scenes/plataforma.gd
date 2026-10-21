extends StaticBody2D

@export var tamanho := Vector2(160, 24)

func _ready() -> void:
	var forma := RectangleShape2D.new()
	forma.size = tamanho
	var colisao := CollisionShape2D.new()
	colisao.shape = forma
	colisao.position = tamanho / 2
	add_child(colisao)

	var visual := ColorRect.new()
	visual.size = tamanho
	visual.color = Color("7a5c3e")
	add_child(visual)
