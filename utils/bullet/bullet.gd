class_name Bullet
extends Area2D

const SPEED : int = 100
var direction : Vector2

func set_direction(dir : Vector2):
	direction = dir
	pass

func _physics_process(delta: float) -> void:
	translate(direction * SPEED * delta)
	pass
	
func _on_body_entered(body: Node2D) -> void:
	var enemy : Enemy = body as Enemy
	
	if body is Enemy:
		enemy.take_damage()
		self.queue_free() 
	pass 
