class_name Enemy
extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var lighthouse = get_node("/root/Game/Lighthouse")

@export var bullet_scene: PackedScene
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var coins : int = 1
var is_alive : bool = false
var is_attacking: bool = false 

signal dead(coins)

func _ready() -> void:
	$AttackArea.lighthouse_entered.connect(_on_lighthouse_entered)
	dead.connect(GameManager.on_enemy_dead)
	pass

func _process(delta: float) -> void:
	var direction = global_position.direction_to(lighthouse.global_position)
	
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

		
	velocity = direction * 25.0
	move_and_slide()

func take_damage():
	cpu_particles_2d.emitting = true

	await get_tree().create_timer(cpu_particles_2d.lifetime).timeout

	is_alive = false
	queue_free()
	dead.emit(coins)
	pass
	
func _on_lighthouse_entered(body: Lighthouse) -> void:
	if is_attacking:
		return
	
	is_attacking = true  

	var bullet: CannonBullet = bullet_scene.instantiate()
	
	add_child(bullet)
	
	bullet.global_position = global_position
	
	bullet.set_direction(global_position.direction_to(lighthouse.global_position))

	is_attacking = false
