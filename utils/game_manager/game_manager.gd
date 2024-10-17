extends Node

var coins : int = 0

signal update_coins(coins)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func on_enemy_dead(new_coins : int):
	coins += new_coins
	update_coins.emit(coins)

func buy_cannon():
	coins += -5
	update_coins.emit(coins)
