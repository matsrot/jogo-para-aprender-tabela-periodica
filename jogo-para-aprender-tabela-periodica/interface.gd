extends CanvasLayer

var selecionados: Array[int] = []

func _ready() -> void:
	GameState.inventario_mudou.connect(_atualizar)
	GameState.mensagem.connect(_mostrar_aviso)
	GameState.missao_concluida.connect(_ao_concluir)
	$Combinar.pressed.connect(_combinar)
	$PainelMissao/Caixa/Continuar.pressed.connect($PainelMissao.hide)
	_atualizar()

func _mostrar_aviso(texto: String) -> void:
	$Aviso.text = texto

func _ao_concluir() -> void:
	$PainelMissao.show()

func _atualizar() -> void:
	selecionados.clear()
	for filho in $Inventario.get_children():
		filho.queue_free()
	for i in GameState.inventario.size():
		var botao := Button.new()
		botao.text = GameState.inventario[i]
		botao.toggle_mode = true
		botao.custom_minimum_size = Vector2(56, 56)
		botao.toggled.connect(_ao_marcar.bind(i))
		$Inventario.add_child(botao)

func _ao_marcar(marcado: bool, indice: int) -> void:
	if marcado:
		selecionados.append(indice)
	else:
		selecionados.erase(indice)

func _combinar() -> void:
	if selecionados.size() != 2:
		$Aviso.text = "Selecione dois elementos no inventário."
		return
	GameState.combinar(GameState.inventario[selecionados[0]], GameState.inventario[selecionados[1]])
