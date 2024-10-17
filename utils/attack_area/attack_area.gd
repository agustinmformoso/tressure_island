extends Area2D

signal enemy_entered(enemy)
signal enemy_exited(enmey)
signal lighthouse_entered(lighthouse)

func _on_body_entered(body: Node2D) -> void:
	# Verifica si el cuerpo es un Enemy
	if body is Enemy:
		enemy_entered.emit(body)
	elif body is Lighthouse:
		lighthouse_entered.emit(body)
	pass

func _on_body_exited(body: Node2D) -> void:
	# Verifica si el cuerpo es un Enemy para emitir la señal de salida de enemigo
	if body is Enemy:
		enemy_exited.emit(body)
	pass
