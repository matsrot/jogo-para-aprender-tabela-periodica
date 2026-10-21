extends Node

signal inventario_mudou
signal mensagem(texto: String)
signal missao_concluida

var inventario: Array[String] = []
var concluida := false

func adicionar(simbolo: String) -> void:
	inventario.append(simbolo)
	inventario_mudou.emit()

func combinar(a: String, b: String) -> void:
	var par := [a, b]
	par.sort()
	if par == ["H", "O"]:
		inventario.erase("H")
		inventario.erase("O")
		inventario.append("H₂O")
		inventario_mudou.emit()
		mensagem.emit("Você criou água (H₂O)! Leve até a plantinha.")
	else:
		mensagem.emit("Esses elementos não reagem aqui. Tente outra combinação!")

func entregar_agua() -> void:
	if concluida:
		return
	if "H₂O" in inventario:
		inventario.erase("H₂O")
		concluida = true
		inventario_mudou.emit()
		missao_concluida.emit()
	else:
		mensagem.emit("A plantinha está seca. Ela precisa de água!")
