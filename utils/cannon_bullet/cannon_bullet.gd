class_name CannonBullet
extends Area2D

const SPEED : int = 100
var direction : Vector2

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func set_direction(dir : Vector2):
	direction = dir
	pass

func _physics_process(delta: float) -> void:
	translate(direction * SPEED * delta)
	pass
	
func _on_body_entered(body: Node2D) -> void:
	var lighthouse : Lighthouse = body as Lighthouse
	
	if body is Lighthouse:
		lighthouse.take_damage()
	pass 
